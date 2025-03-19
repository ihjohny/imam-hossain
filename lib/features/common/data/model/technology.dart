class Technology {
  final String name;
  final String type;

  Technology({
    required this.name,
    required this.type,
  });

  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}
