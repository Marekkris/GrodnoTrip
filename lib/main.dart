import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/map_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDarkTheme = false;

  // Метод для переключения темы
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrodnoTrip',
      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MapScreen(onToggleTheme: toggleTheme, isDarkTheme: isDarkTheme),
    );
  }
}
