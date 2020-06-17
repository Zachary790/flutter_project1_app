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
  //
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _inShowFloatingBtn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
//      print('监听到滚动...${_controller.offset}');
      setState(() {
        _inShowFloatingBtn = _controller.offset >= 1000;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听:
     * controller:
     *   1.可以设置默认值offset
     *   2.监听滚动,也可以监听位置
     *   3.不能监听开始滚动,和结束滚动
     * NotificationListener:
     *   1.监听开始滚动,和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: Text("Slivers Demo"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification){
          if (notification is ScrollStartNotification) {
            print('开始:${notification.metrics.maxScrollExtent}');
          }else if (notification is ScrollUpdateNotification){
            print('滚动:${notification.metrics.maxScrollExtent} == ${notification.metrics.pixels}');
          }else if (notification is ScrollEndNotification) {
            print('结束');
          }
          return true;
        },
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人$index"),
          );
        }),
      ),
      floatingActionButton: _inShowFloatingBtn ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      ) : null,
    );
  }
}
