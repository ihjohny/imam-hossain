class Link {
  final String url;
  final String display;

  Link({
    required this.url,
    required this.display,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'] as String,
      display: json['display'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'display': display,
    };
  }
}
