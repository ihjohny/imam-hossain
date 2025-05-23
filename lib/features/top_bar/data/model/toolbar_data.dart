import 'package:imam_hossain/features/top_bar/data/model/toolbar_item.dart';

class ToolbarData {
  final List<ToolbarItem> items;

  ToolbarData({required this.items});

  factory ToolbarData.fromJson(List<dynamic> json) {
    List<ToolbarItem> items = json.map((e) => ToolbarItem.fromJson(e)).toList();
    return ToolbarData(items: items);
  }

  List<Map<String, dynamic>> toJson() {
    return items.map((project) => project.toJson()).toList();
  }
}
