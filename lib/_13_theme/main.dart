import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1app/_13_theme/shared/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: HYAppTheme.norTheme,
      darkTheme: HYAppTheme.darkTheme,
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
