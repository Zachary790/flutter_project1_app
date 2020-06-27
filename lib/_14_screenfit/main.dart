import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shared/size_fit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

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

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 2.手机屏幕的大小（逻辑分辨率）
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print('屏幕的宽高：$width * $height');
    final statusHeight = MediaQuery.of(context).padding.top;
    print('状态栏的高度：$statusHeight');
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("列表测试")
        ),
      ),
      body: Text("hello"),
    );
  }
}
