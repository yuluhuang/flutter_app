import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/web_view.dart';
import 'package:flutter_app/screens/feedParser.dart';
import 'package:flutter_app/services/httpService/index.dart';
import 'package:flutter_app/services/httpService/config.dart';

class First extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstState();
  }
}

class FirstState extends State<First> with SingleTickerProviderStateMixin {
  int page = 1;
  int pageSize = 15;

  // date end_date
  bool isLoading = true;
  var params = {};

  // 总页数
  int totalPages = 1;
  var now = DateTime.now();
  var lists = [];
  ScrollController _scrollController = new ScrollController();
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 300, 100];

  _getData() async {
    var _lists = lists;
    try {
      // TODO 自己的那个小米手机不支持请求库
      var res = await httpService.netFetch(
          ApiConfig.get_fp_today, params, null, new Options(method: 'POST'));
      // Response res = await Dio().post(ApiConfig.get_fp_today,  data: params);
      print(res);

      if (res.data['code'] != 200) return;
      print(res.data["feedParserList"].length);
      if (res.data["feedParserList"].length == 0) {
        _toNextDay();
        return;
      }

      for (var i = 0; i < res.data["feedParserList"].length; i++) {
        var row = res.data["feedParserList"][i];
        _lists.add(row);
      }
      setState(() {
        isLoading = false;
        lists = _lists;
        totalPages = (res.data["count"] ~/ pageSize) + 1;
        print(totalPages);
      });
    } catch (e) {
      print(e);
    } finally {}
  }

  @override
  void initState() {
    super.initState();
    // LocalStorage.save(Config.TOKEN_KEY,
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1YTE5M2RhOGVmYzY2YTQxNjkyMDZmMWIiLCJleHAiOiIyMDIwLTExLTA5VDA2OjU5OjI2Ljc2NFoifQ.RtNv-IPxa9_HbMFvZufQXHkxAd9hIQQkL1y0H-LH3Bg');
    setState(() {
      isLoading = true;
      params = {"page": page, "size": pageSize};
    });
    _getData();
    _scrollController.addListener(() {
      if (isLoading) {
        return;
      }
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        // print('滑动到了最底部');
        setState(() {
          isLoading = true;
          params["page"] = page;
        });
        if (page <= totalPages) {
          page++;
          // print('加载更多 pageno:' + pageno.toString());
          // 加载更多

          _getData();
        } else {
          // 没有更多了
          // showToast("没有更多了");

          _toNextDay();
        }
      }
    });
  }

  _toNextDay() {
    var end = DateTime.parse('${now.year}-${now.month}-${now.day}');
    var start = end.subtract(const Duration(days: 1));
    setState(() {
      page = 1;
      now = start;
      params["page"] =
          1; // {"page": page, "size": pageSize, "date": start.millisecond, "end_date": end.millisecond};
      params["date"] =
          '${start.year}-${start.month}-${start.day}'; // .millisecondsSinceEpoch;
      params["end_date"] =
          '${end.year}-${end.month}-${end.day}'; // .millisecondsSinceEpoch;
    });
    _getData();
  }

  /*
   * 下拉刷新方法
   */
  Future<Null> _onRefresh() async {
    lists = [];
    setState(() {
      isLoading = true;
    });
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      shrinkWrap: true, //是否根据子widget的总长度来设置ListView的长度，默认值为false
      // physics: new NeverScrollableScrollPhysics(), // 禁用问题列表子组件的滚动事件
      //itemCount +1 为了显示加载中progressbar和暂无数据
      itemCount: lists.length,
      itemBuilder: (context, index) {
        if (lists.length == 0 && isLoading) {
          // 加载中
          return _buildProgressIndicator();
        } else if (lists.length == 0 && !isLoading) {
          // 暂无数据
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('暂无数据！'),
              ],
            ),
          );
        } else if (lists.length == index && !isLoading) {
          // 多加的那个1，其实没数据应该不显示，去掉这个显示会报错
          return _buildProgressIndicator();
        } else {
          // 列表显示
          return new GestureDetector(
            // 列表的点击tap事件
            onTap: () => _handleTapToDetail(context, index),
            child: Card(
              child: _buildContainer(index),
            ),
          );
        }
      },
      controller: _scrollController,
    );
  }

  _handleTapToDetail(BuildContext context, int index) async {
    //  列表的点击tap事件 进入详情或者其他操作等逻辑
    final result = Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) =>
            new WebviewScreen(arguments: lists[index]["link"]),
      ),
    );
    // 不能用
    // final result = await Navigator.of(context).pushNamed(WebviewScreen.routeName, arguments: lists[index]["link"]);
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('result'),));
    // Navigator.pushNamed(context, "/webView");
  }

  _buildContainer(int index) {
    // 具体显示列表内容的布局，此处略
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index % 3]],
      child: Stack(
        children: [
          Container(
            margin: new EdgeInsets.only(right: 33),
            padding: new EdgeInsets.only(top: 5,left: 5, right: 5, bottom: 5),
            child: Text(
              '${lists[index]["title"]}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1.0), //opacity：不透明度
                fontFamily: 'PingFangBold',
                fontSize: 15.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 9,
            child: Container(
              alignment: Alignment.center,
              height: 30.0,
              width: 30,
              child: GestureDetector(
                onTap: () {

                },
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Sqflite demo', textAlign: TextAlign.center)),
      // ),
      body: Stack(
        children: [
          RefreshIndicator(
            child: _buildList(),
            onRefresh: _onRefresh,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 17.0,
              child: Text(
                isLoading ? '加载中...' : '',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
