import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_vo.dart';

class ContactSiderList extends StatefulWidget {
  final List<ContactVO> items;
  final IndexedWidgetBuilder headerBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList({
    Key key,
    @required this.items,
    this.headerBuilder,
    @required this.itemBuilder,
    @required this.sectionBuilder,
  }) : super(key: key);

  @override
  ContactState createState() => new ContactState();
}

class ContactState extends State<ContactSiderList> implements SectionInderxer {
  Color _pressColor = Colors.transparent;

  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 列表加载更多
          NotificationListener(
              onNotification: _onNotification,
              child: ListView.builder(
                  // list 里面的内容不足一屏时，list都可以滚到
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          _isShowHeaderView(index),
                          Offstage(
                            offstage: _shouldShowHeader(index),
                            child: widget.sectionBuilder(context, index),
                          ),
                          Column(
                            children: [
                              widget.itemBuilder(context, index),
                            ],
                          )
                        ],
                      ),
                    );
                  })),
          // 字母排序
          Positioned(
              right: 0,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: 32,
                color: _pressColor,
                child: GestureDetector(
                  onTapDown: (TapDownDetails t) {
                    // 手指按下
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  onTapUp: (TapUpDetails t) {
                    // 手指弹起
                    setState(() {
                      _pressColor = Colors.transparent;
                    });
                  },
                  onVerticalDragStart: (DragStartDetails details) {
                    // 手指垂直滑动
                    setState(() {
                      _pressColor = Colors.transparent;
                    });
                  },
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    // 手指垂直滑动
                  },
                  child: ListView.builder(
                      controller: ScrollController(),
                      itemCount: siderBarKey.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          height: 17.0,
                          child: Text(siderBarKey[index]),
                        );
                      }),
                ),
              ))
        ],
      ),
    );
  }

  @override
  listScrollToPosition(int index) {
    for (var i = 0; i < widget.items.length; i++) {
      if (siderBarKey[index] == "" || siderBarKey[index] == '') {
        _scrollController.jumpTo(0);
        setState(() {});
      } else if (widget.items[i].seationKey == siderBarKey[index]) {
        return i;
      }
    }
    return -1;
  }

  bool _shouldShowHeader(int position) {
    if (position < 0) {
      return false;
    }
    if (position == 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }
}

abstract class SectionInderxer {}

const siderBarKey = <String>[
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "M",
  "Q",
  "W",
  "R",
  "T",
  "Y",
  "U",
];
