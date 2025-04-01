import 'dart:ui';

extension StringExt on String? {
  String? capitalize() {
    if (this == null) return null;

    if (this!.trim().isEmpty) return "";
    return this!.split(" ").map((element) {
      return "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}";
    }).join(" ");
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension HexColor on String {
  Color toColor(Color defaultValue) {
    if (length == 6) {
      return Color(int.parse('0xFF$this'));
    } else if (length == 8) {
      return Color(int.parse('0x$this'));
    } else {
      return defaultValue;
    }
  }
}
