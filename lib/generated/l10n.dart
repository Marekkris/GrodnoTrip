// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Grodno`
  String get appBarText {
    return Intl.message(
      'Grodno',
      name: 'appBarText',
      desc: '',
      args: [],
    );
  }

  /// `Click on the map to set a label`
  String get helpMessage {
    return Intl.message(
      'Click on the map to set a label',
      name: 'helpMessage',
      desc: '',
      args: [],
    );
  }

  /// `There is no access to the user's location`
  String get geolocationResolution {
    return Intl.message(
      'There is no access to the user\'s location',
      name: 'geolocationResolution',
      desc: '',
      args: [],
    );
  }

  /// `Your point`
  String get newUserPointName {
    return Intl.message(
      'Your point',
      name: 'newUserPointName',
      desc: '',
      args: [],
    );
  }

  /// `Setting up labels`
  String get markerSettings {
    return Intl.message(
      'Setting up labels',
      name: 'markerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Grodno Zoo`
  String get Zoo {
    return Intl.message(
      'Grodno Zoo',
      name: 'Zoo',
      desc: '',
      args: [],
    );
  }

  /// `Ice Palace Sports`
  String get IcePalaceSports {
    return Intl.message(
      'Ice Palace Sports',
      name: 'IcePalaceSports',
      desc: '',
      args: [],
    );
  }

  /// `Olympic Reserve Center`
  String get OlympicReserveCenter {
    return Intl.message(
      'Olympic Reserve Center',
      name: 'OlympicReserveCenter',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Center Trinity`
  String get Trinity {
    return Intl.message(
      'Shopping Center Trinity',
      name: 'Trinity',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Center OldCity`
  String get Oldcity {
    return Intl.message(
      'Shopping Center OldCity',
      name: 'Oldcity',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Center Karona`
  String get Karona {
    return Intl.message(
      'Shopping Center Karona',
      name: 'Karona',
      desc: '',
      args: [],
    );
  }

  /// `Park Zhilebera`
  String get ParkZhilebera {
    return Intl.message(
      'Park Zhilebera',
      name: 'ParkZhilebera',
      desc: '',
      args: [],
    );
  }

  /// `Drama Theatre`
  String get DramaTheatre {
    return Intl.message(
      'Drama Theatre',
      name: 'DramaTheatre',
      desc: '',
      args: [],
    );
  }

  /// `Church of St. Francis Xavier`
  String get ChurchSt_FrancisXavier {
    return Intl.message(
      'Church of St. Francis Xavier',
      name: 'ChurchSt_FrancisXavier',
      desc: '',
      args: [],
    );
  }

  /// `Lutheran Church`
  String get LutheranChurch {
    return Intl.message(
      'Lutheran Church',
      name: 'LutheranChurch',
      desc: '',
      args: [],
    );
  }

  /// `New Castle`
  String get NewCastle {
    return Intl.message(
      'New Castle',
      name: 'NewCastle',
      desc: '',
      args: [],
    );
  }

  /// `Old Castle`
  String get OldCastle {
    return Intl.message(
      'Old Castle',
      name: 'OldCastle',
      desc: '',
      args: [],
    );
  }

  /// `Fire Tower`
  String get FireTower {
    return Intl.message(
      'Fire Tower',
      name: 'FireTower',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment_Park`
  String get EntertainmentPark {
    return Intl.message(
      'Entertainment_Park',
      name: 'EntertainmentPark',
      desc: '',
      args: [],
    );
  }

  /// `Route`
  String get Route {
    return Intl.message(
      'Route',
      name: 'Route',
      desc: '',
      args: [],
    );
  }

  /// `Zoo`
  String get keyZoo {
    return Intl.message(
      'Zoo',
      name: 'keyZoo',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get keySports {
    return Intl.message(
      'Sport',
      name: 'keySports',
      desc: '',
      args: [],
    );
  }

  /// `Shopping centers`
  String get keyShoppingCenters {
    return Intl.message(
      'Shopping centers',
      name: 'keyShoppingCenters',
      desc: '',
      args: [],
    );
  }

  /// `Landmarks`
  String get keLandmarks {
    return Intl.message(
      'Landmarks',
      name: 'keLandmarks',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get keyEntertainment {
    return Intl.message(
      'Entertainment',
      name: 'keyEntertainment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
