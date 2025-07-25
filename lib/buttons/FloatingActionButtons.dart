 import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';


Positioned compassButton( ValueNotifier<double> azimuthNotifier,Future<void> Function() resetCameraToNorth) {
  return Positioned(
    bottom: 180,
    right: 16,
    child: ValueListenableBuilder<double>(
      valueListenable: azimuthNotifier,
      builder: (context, azimuth, child) {
        return Transform.rotate(
          angle: -(azimuth * pi / 180) - (pi / 4), // Преобразуем азимут в радианы и корректируем вращение
          child: FloatingActionButton(
            heroTag: 'unique_tag_1',
            onPressed: resetCameraToNorth, // Метод для сброса камеры на север
            shape: const CircleBorder(),
            child: const Icon(Icons.explore),
          ),
        );
      },
    ),
  );
}

Positioned locationButton(ValueNotifier<double> zoomNotifier,double defaultZoomLevel ,Future<void> Function(double) moveToUserLocation) {
  return Positioned(
    bottom: 120,
    right: 16,
    child: ValueListenableBuilder<double>(
      valueListenable: zoomNotifier,  // Следим за изменением зума
      builder: (context, zoom, child) {
        return FloatingActionButton(
          heroTag: 'unique_tag_2',
          onPressed: () {
            double zoomLevelToUse = zoom < defaultZoomLevel 
            ? defaultZoomLevel : zoom;
            moveToUserLocation(zoomLevelToUse);  // Передаем корректное значение зума
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.my_location),
        );
      },
    ),
  );
}

Positioned addMarkerButton( context, Function isPlaceMarker) {
  return Positioned(
    bottom: 60,
    right: 80,
    child: FloatingActionButton(
      heroTag: 'unique_tag_3',
      shape: const CircleBorder(),
      onPressed: () {
        isPlaceMarker();  // Активируем установку метки через переданный коллбэк
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(S.of(context).helpMessage),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: const Icon(Icons.add_location_alt_outlined),
    ),
  );
}

Positioned clearButton(VoidCallback clearDrivingMapLines, VoidCallback removeUserMarker) {
  return Positioned(
    bottom: 60,
    right: 16,
    child: FloatingActionButton(
      heroTag: 'unique_tag_4',
      shape: const CircleBorder(),
      onPressed: () {
        clearDrivingMapLines();
        removeUserMarker();
      },
      child: const Icon(Icons.cleaning_services),
    ),
  );
}

