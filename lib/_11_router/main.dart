import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1app/_11_router/unknow.dart';
import '../_11_router/about.dart';

import 'detail.dart';

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
      routes: {
        HYHomePage.routeName: (ctx) => HYHomePage(),
        HYAboutPage.routeName: (ctx) => HYAboutPage(),
      },
      initialRoute: HYHomePage.routeName,  // 默认启动
      onUnknownRoute: (srttings) {
        return MaterialPageRoute(
          builder: (ctx) {
            return HYUnKnowPage();
          }
        );
      },
    );
  }
}

class HYHomePage extends StatefulWidget {
  static const routeName = "/";
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  String _homeMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("首页")
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_homeMessage),
            RaisedButton(
              child: Text("跳转到详情"),
              onPressed: () => _jumpToDetail(context),
            ),
            RaisedButton(
              child: Text("跳转到关于"),
              onPressed: () => _jumpToDetail2(context),
            ),
            RaisedButton(
              child: Text("跳转到设置"),
              onPressed: () => _jumpToSettings(context),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context) {
    // 1.普通的跳转方式  用构造器
    Future result = Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return HYDetailPage("a home message");
      }
    ));
    result.then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(HYAboutPage.routeName,arguments: "111");
  }
  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(HYAboutPage.routeName,arguments: "111");
  }
  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed("/settings");
  }
}
