import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterproject1app/service/http_request.dart';

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

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("列表测试")
        ),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}
class _HYHomeContentState extends State<HYHomeContent> {
  @override
  void initState() {
    super.initState();
    // 发送网络请求
    // 1.创建dio对象
//    final dio = Dio();
//    // 2.发送网络请求
//    dio.get("https://httpbin.org/get").then((value) => print(value));
    HttpRequest.request("https://httpbin.org/get");
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
