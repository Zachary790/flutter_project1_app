import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * widget：
 * 有状态的widget：StatefulWidget 在运行过程中有一些状态（data）需要改变时
 * 无状态的widget：StatelessWidget 内容是确定的，没有状态（data）改变的
 */
class MyApp extends StatelessWidget {
  // build 告诉flutter返回需要渲染什么东西
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HYHomePage()
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("第一个Flutter程序")
        )
      ),
      body: HYContentBody()
    );
  }
}

class HYContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Hello World",
          style: TextStyle(
              fontSize: 40,
              color: Colors.orange
          )
        )
    );
  }

}
