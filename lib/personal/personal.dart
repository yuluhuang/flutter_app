import 'package:flutter/material.dart';
import '../common/touchCallback.dart';
import '../common/wechat_item.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: Image.asset('assets/images/lake.jpg', width: 70, height: 70,),
                  ),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '图图',
                        style: TextStyle(
                          fontSize: 18, color: Color(0xff353535)
                        ),
                      ),
                      Text(
                        '图图',
                        style: TextStyle(
                            fontSize: 18, color: Color(0xffa9a9a9)
                        ),
                      ),
                    ],
                  )),
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: Image.asset('assets/images/lake.jpg', width: 24, height: 24,),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20),
            child: WechatItem(title: '钱包', imagePath: 'assets/images/lake.jpg',),
          )
        ],
      ),
    );
  }

}