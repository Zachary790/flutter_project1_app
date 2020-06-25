import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  final List<String> names = ["aaa","bbb","ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("列表测试")
        ),
      ),
      body: ListView(
        children: names.map((item) {
          return ListItemFul(item, key: ValueKey(item),);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            if (names.length > 0)
              names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemLess extends StatelessWidget {
  final String name;
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  ListItemLess(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
      height: 80,
      color: randColor,
    );
  }
}

class ListItemFul extends StatefulWidget {
  final String name;

  ListItemFul(this.name, {Key key}): super(key: key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
      height: 80,
      color: randColor,
    );
  }
}


