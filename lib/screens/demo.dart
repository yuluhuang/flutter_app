import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  static const String routeName = "/demo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Container(
          child: Center(
        child: Text("Demo Screen"),
      )),
    );
  }
}
