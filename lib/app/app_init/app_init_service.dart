import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

class AppInitService {
  final BehaviorSubject<bool> _isSuccess = BehaviorSubject<bool>();

  Stream<bool> get isSuccess => _isSuccess.stream;

  Future<void> appStartup() async {
    try {
      await Future.wait([
        EasyLocalization.ensureInitialized(),
        GoogleFonts.pendingFonts([GoogleFonts.notoSansDisplay()]),
      ]);
      _isSuccess.add(true);
    } catch (e) {
      _isSuccess.addError(e);
    }
  }

  void dispose() {
    _isSuccess.close();
  }
}
