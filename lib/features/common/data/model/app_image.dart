class AppImage {
  final String? assetName;

  AppImage({this.assetName});

  factory AppImage.fromJson(Map<String, dynamic> json) {
    return AppImage(
      assetName: json['assetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetName': assetName,
    };
  }
}
