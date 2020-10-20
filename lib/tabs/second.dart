import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart' as prefix0;
import 'package:english_words/english_words.dart';

class Second extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
//          primarySwatch: Colors.blue,
          primaryColor: Colors.blue),
//        home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text('Welcome to 余芦煌 '),
//          ),
//          body: new Center(
////          child: new Text('Hello Word')
//              child: new RandomWorks()),
//        )
//    );
      home: new RandomWorks(),
    );
  }
}



class RandomWorks extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWorks> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<prefix0.WordPair>();
  final _biggerFront = const TextStyle(fontSize: 18.0);

  get() async {
//    Response response = await Dio().post(ApiConfig.get_random_feed);
//    print(response);
  }

  void _pushSaved() {
    // ignore: missing_return
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFront,
          ),
        );
      });
      final divided =
      ListTile.divideTiles(tiles: tiles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(prefix0.generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(prefix0.WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFront,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        this.get();
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
