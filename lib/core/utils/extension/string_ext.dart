import 'dart:ui';

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
