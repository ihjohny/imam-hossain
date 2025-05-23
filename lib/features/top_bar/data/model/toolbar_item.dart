class ToolbarItem {
  final String? key;
  final String? title;

  ToolbarItem({this.key, this.title});

  factory ToolbarItem.fromJson(Map<String, dynamic> json) {
    return ToolbarItem(
      key: json['key'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'title': title,
    };
  }
}
