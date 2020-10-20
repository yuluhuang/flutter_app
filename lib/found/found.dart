import 'package:flutter/material.dart';
import '../common/wechat_item.dart';

class Found extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Found> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              child: WechatItem(
                imagePath: 'assets/images/lake.jpg',
                title: '朋友圈',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Column(
                children: [
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '扫一扫',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '摇一摇',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Column(
                children: [
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '看一看',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '搜一搜',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Column(
                children: [
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '看一看',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  WechatItem(
                    imagePath: 'assets/images/lake.jpg',
                    title: '搜一搜',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              color: Colors.white,
              child: WechatItem(
                imagePath: 'assets/images/lake.jpg',
                title: '小程序',
              ),
            )
          ],
        ),
      ),
    );
  }
}
