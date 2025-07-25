import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_application_2/models/map_point.dart';
import 'package:flutter_application_2/marker_settings_view.dart';

/// Метод для генерации точек на карте
  List<MapPoint> getMapPoints( BuildContext context) {
    List<MapPoint> points = [];
    //Зоопарк
    if(markerVisibility['zoo'] == true){
      points.addAll([
      MapPoint(name: S.of(context).Zoo, latitude: 53.688882, longitude: 23.848488,icon: "assets/images/zoo_marker.png")]);
    }
    //Спорт
    if (markerVisibility['sports'] == true) {
      points.addAll( [
      MapPoint(name: S.of(context).IcePalaceSports, latitude:  53.688207, longitude: 23.824099,icon: "assets/images/sport_marker.png"),
      MapPoint(name: S.of(context).OlympicReserveCenter, latitude: 53.688914, longitude: 23.820973,icon :"assets/images/sport_marker.png")]);
    }
        // Торговые центры
    if (markerVisibility['shoppingCenters'] == true) {
      points.addAll( [
      MapPoint(name: S.of(context).Trinity, latitude: 53.649925, longitude: 23.854763,icon: "assets/images/shopping-center_marker.png" ),
      MapPoint(name: S.of(context).Oldcity, latitude: 53.701683, longitude: 23.835196,icon: "assets/images/shopping-center_marker.png"),
      MapPoint(name: S.of(context).Karona, latitude: 53.672178, longitude: 23.863134,icon: "assets/images/shopping-center_marker.png"),
      MapPoint(name: S.of(context).Karona, latitude: 53.711340, longitude: 23.817198,icon: "assets/images/shopping-center_marker.png")]);
    }
    //Достопримечательности
    if (markerVisibility['landmarks'] == true){
      points.addAll( [
      MapPoint(name: S.of(context).ParkZhilebera, latitude: 53.684869, longitude: 23.837043,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).DramaTheatre, latitude: 53.675364, longitude: 23.827655,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).ChurchSt_FrancisXavier, latitude: 53.678189, longitude: 23.831393,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).LutheranChurch, latitude: 53.686536, longitude: 23.840500,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).NewCastle, latitude: 53.676221, longitude: 23.825639,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).OldCastle, latitude: 53.677023, longitude: 23.823488,icon: "assets/images/landmark_marker.png"),
      MapPoint(name: S.of(context).FireTower, latitude: 53.677859, longitude: 23.824843,icon: "assets/images/landmark_marker.png")]);
    }
    // Развлечения
    if (markerVisibility['entertainment'] == true) {
      points.addAll( [
      MapPoint(name: S.of(context).EntertainmentPark, latitude: 53.686833, longitude: 23.837557, icon: "assets/images/entertainment-park_marker.png"),
      ]);
    }
    
    return points;

  }