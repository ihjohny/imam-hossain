class Company {
  final String? name;
  final String? link;
  final String? place;

  Company({
    this.name,
    this.link,
    this.place,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String?,
      link: json['link'] as String?,
      place: json['place'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'link': link,
        'place': place,
      };
}
