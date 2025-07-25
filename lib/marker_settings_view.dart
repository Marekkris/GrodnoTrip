import 'package:flutter/material.dart';
import 'package:flutter_application_2/generated/l10n.dart';

class MarkerSettingsScreen extends StatefulWidget {
  final Map<String, bool> markerVisibility;
  final Function(String, bool) onToggleCategory;

  const MarkerSettingsScreen({
    super.key,
    required this.markerVisibility,
    required this.onToggleCategory,
  });

  @override
  State<MarkerSettingsScreen> createState() => _MarkerSettingsScreenState();
}

class _MarkerSettingsScreenState extends State<MarkerSettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).markerSettings)),
      body: ListView(
        children: widget.markerVisibility.keys.map((category) {
          return SwitchListTile(
            title: Text(_getCategoryName(category)),
            value: widget.markerVisibility[category]!,
            onChanged: (bool value) {
              widget.onToggleCategory(category, value);
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }

  // Преобразование ключа в читаемое имя категории
  String _getCategoryName(String categoryKey) {
    switch (categoryKey) {
      case 'zoo':
        return S.of(context).keyZoo;
      case 'sports':
        return S.of(context).keySports;
      case 'shoppingCenters':
        return S.of(context).keyShoppingCenters;
      case 'landmarks':
        return S.of(context).keLandmarks;
      case 'entertainment':
        return S.of(context).keyEntertainment;
      default:
        return '';
    }
  }
}
 Map<String, bool> markerVisibility = {
    'zoo': true,
    'sports': true,
    'shoppingCenters': true,
    'landmarks': true,
    'entertainment': true,
};
