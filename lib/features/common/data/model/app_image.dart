class AppImage {
  final String? assetName;
  final String? iconType;

  AppImage({this.assetName, this.iconType});

  factory AppImage.fromJson(Map<String, dynamic> json) {
    return AppImage(
      assetName: json['assetName'] as String?,
      iconType: json['iconType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetName': assetName,
      'iconType': iconType,
    };
  }
}
