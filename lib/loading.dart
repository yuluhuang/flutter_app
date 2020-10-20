import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration(seconds: 3), () {
      print("loading");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Image.asset("assets/images/lake.jpg"),
    );
  }


}