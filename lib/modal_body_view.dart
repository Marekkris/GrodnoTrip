import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'models/map_point.dart';

class ModalBodyView extends StatelessWidget {
  const ModalBodyView({
    required this.point,
    required this.userLocation,
    required this.onRouteRequested,
    
  });

  final MapPoint point;
  final CameraPosition? userLocation;
  final Function(Point startPoint, Point endPoint) onRouteRequested;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/location_marker.png',height: 50,), // Ваша картинка
          Text(point.name, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20, width: double.infinity),
          Text(
            '${point.latitude}, ${point.longitude}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Кнопка для построения маршрута
          ElevatedButton(
            onPressed: userLocation == null
                ? null  // Отключаем кнопку, если нет данных о геолокации
                : () {
                    // Отправляем запрос на построение маршрута от геолокации пользователя до выбранной точки
                    onRouteRequested(
                      Point(latitude: userLocation!.target.latitude, longitude: userLocation!.target.longitude),
                      Point(latitude: point.latitude, longitude: point.longitude),
                    );
                    Navigator.pop(context); 
                  },
            child:  Text(S.of(context).Route),
          )
        ],
      ),
    );
  }
  
}