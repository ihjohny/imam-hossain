class SkillItem {
  final String name;
  final String type;

  SkillItem({
    required this.name,
    required this.type,
  });

  factory SkillItem.fromJson(Map<String, dynamic> json) => SkillItem(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}
