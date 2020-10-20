import 'package:flutter/material.dart';
import './message_data.dart';
import 'package:date_format/date_format.dart';
import '../common/touchCallback.dart';

class MessageItem extends StatelessWidget {
  final MessageData message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9))),
      ),
      height: 64.0,
      child: TouchCallBack(
        onPressed: () {

        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Image.network(message.avator, width: 48, height: 48,),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.title,
                  style: TextStyle(fontSize: 16.0, color: Color(0xff353535)),
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                ),
                Text(
                  message.subTitle,
                  style: TextStyle(fontSize: 14, color: Color(0xffa9a9a9)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12, top: 12),
              child: Text(
                formatDate(message.time, [HH, ':', nn, ':', 'ss']).toString(),
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }


}