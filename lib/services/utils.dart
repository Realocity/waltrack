import 'package:url_launcher/url_launcher.dart';

Future openEmail({
  required String toEmail, 
  required String subject, 
  required String body,
  }) async {
  if (await canLaunch("mailto:$toEmail")) {
    await launch("mailto:$toEmail?subject=$subject&body=$body");
  } else {
    throw 'Could not launch email client';
  }
}