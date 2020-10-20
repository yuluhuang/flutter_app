import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/touchCallback.dart';

class WechatItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final icon;

  WechatItem({Key key, @required this.title, this.imagePath, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
        child: Container(
          height: 50,
            child: Row(
              children: [
                Container(
                  child: imagePath != null ? Image.asset(imagePath, width:  32, height: 32,) : SizedBox(
                    height: 32,
                    width: 32,
                    child: icon,
                  ),
                  margin: const EdgeInsets.only(left: 22, right: 20),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
        ),
        onPressed: () {
          switch (title) {
            case '朋友圈':
              Navigator.pushNamed(context, "/friends");
              break;
            case '收藏':
              // Navigator.pushNamed(context, "/friends");
              break;
          }
        });
  }
}
