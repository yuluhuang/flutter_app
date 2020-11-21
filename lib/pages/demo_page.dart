import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  // static const String routeName = "/demo";

  @override
  Widget build(BuildContext context) {
    const CITY = ['北京', '上海', '广东', '西安', '温州', '乐器', '成都', '西藏', '新疆', '香港'];
    const city_names = {
      '北京': ['北京', '上海', '广东', '西安', '温州', '乐器', '成都', '西藏', '新疆', '香港'],
      '上海': ['北京', '上海', '广东', '西安', '温州', '乐器', '成都', '西藏', '新疆', '香港']
    };
    Widget _item(String city) {
      return Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.teal),
        child: Center(
          child: Text(
            city,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }

    Widget _item2(String city) {
      return Container(
        width: 160,
        margin: EdgeInsets.only(right: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.teal),
        child: Center(
          child: Text(
            city,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }

    Widget _buildSub(String subCity) {
      return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Text(subCity),
        ),
      );
    }

    Widget _item3(String city, List<String> subCities) {
      return ExpansionTile(
        title: Text(
          city,
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
        children: subCities.map((subCity) => _buildSub(subCity)).toList(),
      );
    }

    Widget _item4(String city) {
      return Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.teal),
        child: Text(
          city,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }

    List<Widget> _buildList() {
      return CITY.map((city) => _item(city)).toList();
    }

    List<Widget> _buildList2() {
      return CITY.map((city) => _item2(city)).toList();
    }

    List<Widget> _buildList3() {
      List<Widget> widget = [];
      city_names.keys.forEach((key) {
        widget.add(_item3(key, city_names[key]));
      });
      return widget;
    }

    List<Widget> _buildList4() {
      return CITY.map((city) => _item4(city)).toList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        // body: Column(
        //   children: [
        //     Container(
        //       height: 300,
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: _buildList3(),
        //       ),
        //     )
        //   ],
        // body: Container(
        //   child: ListView(
        //     children: _buildList3(),
        //   ),
        // ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _buildList4(),
        ));
  }
}
