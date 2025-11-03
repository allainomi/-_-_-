import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(JamiaApp());

class JamiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جامعہ عائشۃ صدیقہ',
      home: Scaffold(
        appBar: AppBar(
          title: Text('جامعہ عائشۃ صدیقہ لبنات الاسلامیہ'),
          backgroundColor: Colors.green[800],
        ),
        body: WebView(
          initialUrl: 'assets/jamia.html',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
