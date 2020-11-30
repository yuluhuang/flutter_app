import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// import 'package:english_words/english_words.dart' as prefix0;
// import 'package:english_words/english_words.dart';
import 'package:flutter_app/models/Schedule.dart';
import 'package:flutter_app/database/ScheduleDB.dart';

class Six extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.blue),
      home: new RandomWorks(),
    );
  }
}

class RandomWorks extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class TaskData {
  String title;
  int integral;

  TaskData(this.title, this.integral);
}

List<TaskData> taskData = [
  // 短期
  new TaskData('早睡(10:00之前)', 200),
  new TaskData('早起(7:00之前)', 200),
  new TaskData('每日打卡', 200),
  new TaskData('晨读0.5h', 200),
  new TaskData('喝水', 200),
  new TaskData('刷牙', 200),
  new TaskData('洗脸', 200),
  new TaskData('洗澡', 200),
  new TaskData('睡觉', 200),
  new TaskData('喝完1杯水，', 200),
  new TaskData('英语学习0.5h', 200),
  new TaskData('平板撑10分钟', 200),
  new TaskData('深蹲50', 200),
  new TaskData('俯卧撑50', 200),
  new TaskData('跑步30分钟', 200),
  new TaskData('睡前阅读0.5h', 200),
  new TaskData('写文章', 200),
  new TaskData('阅读告戒子书', 200),
  new TaskData('自省', 200),
  new TaskData('写一手漂亮的字', 200),
  // 长期 周计划
];

class RandomWordsState extends State<RandomWorks> {
  final _suggestions = <Schedule>[];
  final _saved = new Set<Schedule>();
  final _biggerFront = const TextStyle(fontSize: 18.0);

  var scheduleDB = new ScheduleDB();

  // Insert a dog into the database (在数据库插入一条狗狗的数据)

  get() async {
//    Response response = await Dio().post(ApiConfig.get_random_feed);
//    print(response);
    var now = DateTime.now();
    var date = '${now.year}-${now.month}-${now.day}';
    List<Schedule> schedules = await scheduleDB.getByDate(date);
    if (schedules.length != 0) {
      // TODO tip
      // return;
      await scheduleDB.deleteAll();
    }
    taskData.forEach((task) async {
      var fido = Schedule(
          // id: 1,
          name: task.title,
          date: date,
          integral: task.integral,
          progress: 0);
      print(task);
      await scheduleDB.insertSchedule(fido);
    });
    List<Schedule> ss = await scheduleDB.schedules();
    _suggestions.clear();

    setState(() {
      _suggestions.addAll(ss);
    });
    // TODO 如何触发页边更新
  }

  getData() async {
    List<Schedule> schedules = await scheduleDB.schedules();
    print(schedules);
    _suggestions.addAll(schedules);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(children: [
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: _buildSuggestions(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.get();
        },
        tooltip: 'Increment',
        child: new Text(count.toString()), // TODO change int
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: _suggestions.length * 2,
        // padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return new Divider(
              height: 1,
            );
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // _suggestions.addAll(taskData);
          }
          // return Ink(color: Colors.lightGreen, child: _buildRow(_suggestions[index]));
          return Container(
            // margin: EdgeInsets.all(0.0),
            decoration: new BoxDecoration(
                color: _saved.contains(_suggestions[index])
                    ? Colors.grey[50]
                    : Colors.white),
            // margin: const EdgeInsets.symmetric(vertical: 2),
            // color: Colors.white, // if current item is selected show blue color
            child: _buildRow(_suggestions[index]),
          );
        });
  }

  Widget _buildRow(Schedule task) {
    final alreadySaved = _saved.contains(task);

    return new ListTile(
      leading: Container(
        decoration: new BoxDecoration(
            // borderRadius: BorderRadius.circular(17), /// 圆角
            border:
                Border(right: BorderSide(color: Colors.grey[200], width: 1))),
        width: 42,
        child: Row(
          children: [
            Center(
              child: new Icon(
                alreadySaved
                    ? Icons.check_box
                    : Icons.check_box_outline_blank_outlined,
                color: alreadySaved ? Colors.red : null,
              ),
            )
          ],
        ),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: _biggerFront,
              ),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '+' + task.integral.toString(),
                style: _biggerFront,
              ),
            ],
          )
        ],
      ),
      // trailing: new Icon(
      //   alreadySaved ? Icons.favorite : Icons.favorite_border,
      //   color: alreadySaved ? Colors.red : null,
      // ),
      onTap: () {
        // this.get();
        setState(() {
          if (alreadySaved) {
            _saved.remove(task);
            count = count - task.integral;
          } else {
            count = count + task.integral;
            _saved.add(task);
          }
        });
      },
    );
  }
}
