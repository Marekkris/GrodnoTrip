import 'package:equatable/equatable.dart';


/// Модель точки на карте
class MapPoint extends Equatable {
 const MapPoint({
   required this.name,
   required this.latitude,
   required this.longitude,
   required this.icon,
  this.isSelected=false
 });


  final String name;
  final double latitude;
  final double longitude;
  final String icon; // путь к иконке маркера
  final bool isSelected;


 @override
 List<Object?> get props => [name, latitude, longitude,icon,isSelected];
}