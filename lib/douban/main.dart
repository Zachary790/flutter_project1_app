import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1app/douban/widgets/pages/main/main.dart';
import 'widgets/dashed_line.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent  // 去掉高亮效果
      ),
      home: HYMainPage(),
    );
  }
}
