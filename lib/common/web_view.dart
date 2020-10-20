import 'package:flutter/material.dart';
import 'package:flutter_app/common/touchCallback.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewScreen extends StatefulWidget {
  static const String routeName = "/webView";

  final arguments;

  WebviewScreen({this.arguments = "1"});

  @override
  State<StatefulWidget> createState() {
    return WebviewState(this.arguments);
  }
}

class WebviewState extends State<WebviewScreen> {
  final String link;

  WebviewState(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: TouchCallBack(
          onPressed: () {
            Navigator.pop(context, '1111');
          },
          child: Center(
            child: WebviewScaffold(
              url: link,
              // appBar: new AppBar(
              //   title: new Text("yuluhuang"),
              // ),
              withZoom: true,
              withLocalStorage: true,
            ),
          ),
        ),
      ),
    );
  }
}
