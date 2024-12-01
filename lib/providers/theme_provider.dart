import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  bool get isDarkTheme => _isDarkMode; // Add this getter

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}


class LocalizationHelper {
  static Map<String, String> _localizedStrings = {};

  static Future<void> load(String locale) async {
    String jsonString = await rootBundle.loadString('l10n/$locale.json');
    _localizedStrings = Map<String, String>.from(json.decode(jsonString));
  }

  static String? translate(String key) {
    return _localizedStrings[key];
  }
}

class LaunchURLHelper {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (kIsWeb) {
      if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
        throw 'Could not launch $url';
      }
    } else {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
}
}


  // Future<void> launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (kIsWeb) {
  //     if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
  //       throw 'Could not launch $url';
  //     }
  //   } else {
  //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

