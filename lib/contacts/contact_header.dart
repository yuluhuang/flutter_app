import 'package:flutter/material.dart';
import './contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactItem(titleName: '新的盆友', imageName: 'assets/images/lake.jpg'),
        ContactItem(titleName: '群聊', imageName: 'assets/images/lake.jpg'),
        ContactItem(titleName: '公众号', imageName: 'assets/images/lake.jpg')
      ],
    );
  }

}