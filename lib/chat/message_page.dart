import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import './message_data.dart';
import './message_item.dart';

const APPBAR_SCROLL_OFFSET = 100;

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  List _imageUrls = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603293131356&di=384a0b5b6e2e6506a38b6ffb9db09ccc&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20151110%2Fmp40704237_1447112984668_2.gif',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603293131356&di=4ec09cc4bdc0b2d670bd590db9b2e9ba&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F14ce36d3d539b60021300597e850352ac65cb717.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603293131355&di=5f0e15583b761eaa7e1e041505b9649e&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fcomic%2Fpics%2Fhv1%2F63%2F154%2F2127%2F138347508.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603293131354&di=7711d1ed5547e3d3d40c32464ea1436b&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fgamephotolib%2F1508%2F23%2Fc2%2F11615424_1440343625938_medium.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603293249258&di=824b7d61f031a2ae6e901ab35bcc8c5c&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F8%2F538ee6cd60dda.jpg',
  ];

  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                // 滚动且是列表滚动的时候
                _onScroll(scrollNotification.metrics.pixels);
                return true;
              }
              return false;
            },
            child: ListView(
              children: [
                Container(
                  height: 160,
                  child: Swiper(
                    itemCount: _imageUrls.length,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        _imageUrls[index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: SwiperPagination(),
                  ),
                ),
                Container(
                  height: 800,
                  child: ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Alum'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Alum'),
                ),
                Container(
                  height: 800,
                  child: ListView.builder(
                      itemCount: messageData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new MessageItem(messageData[index]);
                      }),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('home'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
