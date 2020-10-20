import 'package:flutter/material.dart';
import './contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO item;
  final String titleName;
  final String imageName;

  ContactItem({this.item, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9))),
      ),
      height: 52,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageName == null
                ? Image.network(
                    item.avatarUrl != '' ? item.avatarUrl : 'https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730',
                    width: 36,
                    height: 36,
                    scale: 0.9,
                  )
                : Image.asset(
                    imageName,
                    width: 36,
                    height: 36,
                  ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                titleName == null ? item.name ?? '暂无' : titleName,
                style: TextStyle(fontSize: 18, color: Color(0xff353535)),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
