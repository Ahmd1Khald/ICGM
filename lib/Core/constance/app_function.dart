import 'package:share/share.dart';

class AppFunctions {
  static void shareDuaa({required String textToShare, String subject = ''}) {
    Share.share(
      textToShare,
      subject: subject,
    );
  }
}
