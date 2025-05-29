import 'package:imam_hossain/features/top_bar/data/model/toolbar_item.dart';

class ToolbarData {
  final List<ToolbarItem> _items;

  ToolbarData({
    required List<ToolbarItem> items,
  }) : _items = items;

  factory ToolbarData.fromJson(List<dynamic> json) {
    List<ToolbarItem> items = json.map((e) => ToolbarItem.fromJson(e)).toList();
    return ToolbarData(items: items);
  }

  List<Map<String, dynamic>> toJson() {
    return _items.map((project) => project.toJson()).toList();
  }

  List<ToolbarItem>? getToolbarItems(String deviceType) {
    if (_items.isEmpty) return null;
    return _items.where((item) {
      final showOnly = item.showOnly;
      if (showOnly == null || showOnly.isEmpty) return true;
      return showOnly.contains(deviceType);
    }).toList();
  }
}
