import 'package:flutter/material.dart';
import 'package:flutter_application_2/marker_settings_view.dart'; // Для MarkerSettingsScreen

// Функция для кнопки переключения темы
IconButton switchThemesButton( bool isDarkTheme,Function onToggleTheme) {
  return IconButton(
    icon: Icon(isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round),
    onPressed: () => onToggleTheme(),
  );
}

// Функция для кнопки фильтра маркеров
IconButton markerFilterButton(BuildContext context, Function setState, Map<String, bool> markerVisibility) {
  return IconButton(
    icon: const Icon(Icons.filter_list),
    onPressed: () {
      // Открытие экрана фильтра маркеров с передачей onToggleCategory
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MarkerSettingsScreen(
            markerVisibility: markerVisibility,
            onToggleCategory: (category, isVisible) {
              setState(() {
                markerVisibility[category] = isVisible;  // Обновление видимости маркеров через setState
              });
            },
          ),
        ),
      );
    },
  );
}