import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart'; // Import the generated localization class
import 'presentation/pages/home_page.dart'; // You need to generate this file with the arb files
//flutter pub run intl_utils:generate
// how to deploy website: flutter build web =>  firebase deploy

void main() {
  //debugPaintSizeEnabled = true; 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate, // Generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
           debugShowCheckedModeBanner: false,
      home: HomePage(
        onLocaleChange: (locale) {
          setState(() {
            _locale = locale;
          });
        },
      ),
    );
  }
}
