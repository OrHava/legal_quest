import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class AdWidget extends StatefulWidget {
  const AdWidget({super.key});

  @override
  AdWidgetState createState() => AdWidgetState();
}

class AdWidgetState extends State<AdWidget> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _loadAd();
    }
  }

  void _loadAd() {
    final adScript = html.ScriptElement()
      ..src = 'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-8096185122491583'
      ..async = true
      ..setAttribute('crossorigin', 'anonymous');

    final ins = html.Element.tag('ins')
      ..classes.add('adsbygoogle')
      ..style.display = 'inline-block'
      ..style.width = '728px'
      ..style.height = '90px'
      ..attributes['data-ad-client'] = 'ca-pub-8096185122491583'
      ..attributes['data-ad-slot'] = '7116229843';

    final pushAd = html.ScriptElement()
      ..text = '(adsbygoogle = window.adsbygoogle || []).push({});';

    html.document.body!.children.add(adScript);
    html.document.body!.children.add(ins);
    html.document.body!.children.add(pushAd);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 728,
      height: 90,
      child: kIsWeb ? SizedBox() : Text('Ads not supported on this platform'),
    );
  }
}