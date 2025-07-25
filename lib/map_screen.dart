import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/buttons/FloatingActionButtons.dart';
import 'package:flutter_application_2/buttons/IconButtons.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/models/map_point.dart';
import 'package:flutter_application_2/marker_settings_view.dart';
import 'package:flutter_application_2/modal_body_view.dart';
import 'package:flutter_application_2/points.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {

  final Function onToggleTheme; // Функция для переключения темы
  final bool isDarkTheme; // Флаг для отслеживания текущей темы

  const MapScreen({super.key, required this.onToggleTheme, required this.isDarkTheme});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  late final YandexMapController _mapController;
  
  CameraPosition? _userLocation;
  CameraPosition? _currentPosition;
  // Результаты поиска маршрутов на карте
  DrivingResultWithSession? _drivingResultWithSession;
  
  final List<PolylineMapObject> _drivingMapLines = [];
  
  final ValueNotifier<double> _currentZoomLevel = ValueNotifier(0.0);
  final double _defaultZoomLevel = 12;
  // Текущий поворот карты (azimuth)
  final ValueNotifier<double> _currentAzimuth = ValueNotifier(0.0);
  final double _defaultAzimuth = 0.0;
  // пользовательская метка
  bool  _isPlacingMarker=false;
  MapPoint ? _newUserPoint;

  @override
  void dispose() {
    _mapController.dispose();
    _drivingResultWithSession?.session.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.isDarkTheme ? const Color.fromARGB(255, 73, 14, 110) : Colors.red, // Цвет в зависимости от темы
        title: Text(S.of(context).appBarText),
        foregroundColor: Colors.white,
        actions: [
          switchThemesButton(widget.isDarkTheme,  widget.onToggleTheme),
          markerFilterButton(context, setState, markerVisibility),
           
        ],
      ),
      
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller) async {
              _mapController = controller;
              await _initLocationLayer();
              // приближаем вид карты ближе к Гродно
              await _mapController.moveCamera(
                CameraUpdate.newCameraPosition(
                   CameraPosition(
                    target: const Point(
                      latitude: 53.669353,
                      longitude: 23.81313,
                    ),
                    zoom: _defaultZoomLevel,
                  ),
                ),
              );
            },
            nightModeEnabled:widget.isDarkTheme ? true : false, 
            onMapTap: (point){
              if(_isPlacingMarker){
                setState(() {
                  _clearDrivingMapLines();
                  _newUserPoint=MapPoint(
                    name: S.of(context).newUserPointName, 
                    latitude: point.latitude, 
                    longitude: point.longitude, 
                    icon: "assets/images/location_marker.png",
                    );
                 
                });

                _isPlacingMarker = false;  // Деактивируем режим установки метки
              }
            },
            mapObjects: [
              ..._getPlacemarkObjects(context),
              if (_newUserPoint != null) _createPlacemark(_newUserPoint!, scale: 0.3),
              ..._drivingMapLines,
            ],
            onCameraPositionChanged: (cameraPosition, reason, finished)  {
              _currentZoomLevel.value = cameraPosition.zoom; // Обновляем зум через ValueNotifier
              _currentAzimuth.value = cameraPosition.azimuth; // Азимут через другой ValueNotifier
            },
            onUserLocationAdded:(view) async {
              _moveToUserLocation(_defaultZoomLevel);
              return view.copyWith(
                pin: view.pin.copyWith(
                  opacity: 1,
                ),
              );
            },
            
          ),
          
          compassButton(_currentAzimuth , _resetCameraToNorth),
          locationButton(_currentZoomLevel, _defaultZoomLevel, _moveToUserLocation),
          addMarkerButton(context, () {setState(() {_isPlacingMarker = true;});}),
          clearButton(_clearDrivingMapLines, _removeUserMarker)
        ],
      )
    );
  }
  // Метод для перемещения карты к текущей локации пользователя
  Future<void> _moveToUserLocation(double zoomLevel) async {
    _userLocation = await _mapController.getUserCameraPosition();
    if (_userLocation != null) {
      await _mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          _userLocation!.copyWith(zoom: zoomLevel),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.linear,
          duration: 0.3,
        ),
      );
    }
  }
  // Метод для сброса камеры на север 
  Future<void> _resetCameraToNorth() async {
    _currentPosition = await _mapController.getCameraPosition();
    await _mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          _currentPosition!.copyWith(azimuth: _defaultAzimuth),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.linear,
          duration: 0.3,
        ),
      ); 
    }
  // Метод для инициализации слоя локации
  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted = await Permission.location.request().isGranted;

    if (locationPermissionIsGranted) {
      await _mapController.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(S.of(context).geolocationResolution)),
        );
      });
    }
  }

  Future<void> _buildRoutes() async {
    final drivingResult = await _drivingResultWithSession?.result;

    setState(() {
      for (var element in drivingResult?.routes ?? []) {
        _drivingMapLines.add(
          PolylineMapObject(
            mapId: MapObjectId('route $element'),
            polyline: Polyline(points: element.geometry),
            strokeColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            strokeWidth: 3,
          ),
        );
      }
    });
  }

  void _clearDrivingMapLines(){  
      _drivingMapLines.clear();  // Очистка старых маршрутов
  }
  void _onRouteRequested(Point startPoint, Point endPoint) async {
    // 1. Очистить старые маршруты
      _clearDrivingMapLines();

    // 2. Запрашиваем новый маршрут
    final drivingResultWithSession = _getDrivingResultWithSession(
      startPoint: startPoint,
      endPoint: endPoint,
    );

    // 3. Обновляем состояние с результатом нового маршрута
    setState(() {
      _drivingResultWithSession = drivingResultWithSession;  // Сохраняем результат нового маршрута
      _buildRoutes(); // Строим новый маршрут
    });
  }
  void _removeUserMarker() {
    setState(() {
      _newUserPoint = null;  // Удаляем метку, сбрасывая её значение
    });
  }

  // Метод для получения маршрутов проезда от точки начала к точке конца
  DrivingResultWithSession _getDrivingResultWithSession({
    required Point startPoint,
    required Point endPoint,
  }) {
    var drivingResultWithSession = YandexDriving.requestRoutes(
      points: [
        RequestPoint(
          point: startPoint,
          requestPointType: RequestPointType.wayPoint,
        ),
        RequestPoint(
          point: endPoint,
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
      drivingOptions: const DrivingOptions(
        initialAzimuth: 0,
        routesCount: 5,
        avoidTolls: true,
        avoidPoorConditions: true,
      ),
    );

    return drivingResultWithSession;
  }

  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
    return [
    // Системные точки
    ...getMapPoints(context).map(
      (point) => _createPlacemark(point),
    ),
  ];
  }
    // Вспомогательный метод для создания PlacemarkMapObject
  PlacemarkMapObject _createPlacemark(MapPoint point,{double scale=0.15}) {
    return PlacemarkMapObject(
      mapId: MapObjectId('MapObject ${point.name}'),
      point: Point(latitude: point.latitude, longitude: point.longitude),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(point.icon),
          scale: scale,
        ),
      ),
      onTap: (_, __) {
        // Действия при нажатии на маркер
        showModalBottomSheet(
          context: context,
          builder: (context) => ModalBodyView(
            point: point,
            userLocation: _userLocation,
            onRouteRequested: _onRouteRequested,

          ),
        );
      },
    );
  }


}

