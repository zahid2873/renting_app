import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static showAddressOnMap(String address) async {
    String url = "";
    if (Platform.isIOS) {
      url = "http://maps.apple.com/?q=$address";
    } else {
      url = "https://www.google.com/maps/search/$address";
    }
    Utils.launchUrlLink(url);
  }

  static launchUrlLink(String url) async {
    if (url.isEmpty) {
      debugPrint("Can't launch url, given string is empty");
      return;
    }
    var uri = Uri.tryParse(url);
    if (uri == null) {
      debugPrint("Given string doesnot parse into a valid URI");
      return;
    }
    var parseUrl = Uri.parse(url);
    try {
      await launchUrl(parseUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      //Utils.showToast("Unable to launch url.");
      print("Error launching URL:$e");
    }
  }
}
