import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url != null) {
    final Uri url0 = Uri.parse(url);
    if (await canLaunchUrl(url0)) {
      !await launchUrl(url0);
    } else {
      showSnackBar(context, 'Cannot launch $url');
    }
  }
}