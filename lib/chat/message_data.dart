
class MessageData {
  String avator;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;
  MessageData(this.avator, this.title, this.subTitle, this.time, this.type);
}

enum MessageType {SYSTEM, PUBLIC, CHAT, GROUP}

List<MessageData> messageData = [
  new MessageData('https://t7.baidu.com/it/u=378254553,3884800361&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=79d95a0222af4f275147d8354c531730', 'title', 'subTitle', new DateTime.now(), MessageType.CHAT),
  new MessageData('https://t8.baidu.com/it/u=3571592872,3353494284&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603109618&t=a0223a7ee7d2a512f2913d4cddced1b1', 'title', 'subTitle', new DateTime.now(), MessageType.CHAT)
];