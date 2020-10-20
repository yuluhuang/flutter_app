import 'package:flutter/material.dart';
import 'package:flutter_app/services/httpService/config.dart';
import 'package:flutter_app/services/httpService/index.dart';
import 'package:flutter_app/services/storageService.dart';
import 'package:flutter_app/common/config.dart';

class FeedParserScreen extends StatefulWidget {
  static const String routeName = "/fp";
  final arguments;

  FeedParserScreen({this.arguments = "1"});

  @override
  State<StatefulWidget> createState() {
    return FeedParserState(this.arguments);
  }
}

class FeedParserState extends State<FeedParserScreen> {

  var fp = {};
  final String id;
  FeedParserState(this.id);

  getData () async {
    var res = await httpService.netFetch(ApiConfig.getFeed + this.id, null, null, null);
    print(res.data);
    setState(() {
      fp = res.data;
    });
  }
  @override
  void initState() {
    super.initState();
    LocalStorage.save(Config.TOKEN_KEY, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1YTE5M2RhOGVmYzY2YTQxNjkyMDZmMWIiLCJleHAiOiIyMDIwLTExLTA5VDA2OjU5OjI2Ljc2NFoifQ.RtNv-IPxa9_HbMFvZufQXHkxAd9hIQQkL1y0H-LH3Bg');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final FeedParserState args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("detail")),
      body: Container(
          child: Center(
            child: Text("111"),
          )),
    );
  }

}
