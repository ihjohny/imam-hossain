class ToolbarItem {
  final String? key;
  final String? title;
  final String? showOnly;

  ToolbarItem({
    this.key,
    this.title,
    this.showOnly,
  });

  factory ToolbarItem.fromJson(Map<String, dynamic> json) {
    return ToolbarItem(
      key: json['key'] as String?,
      title: json['title'] as String?,
      showOnly: json['showOnly'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'title': title,
      'showOnly': showOnly,
    };
  }
}
