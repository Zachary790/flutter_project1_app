import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
// 1. 创建全局的EventBus对象
final eventBus = EventBus();

class UserInfo{
  String nickname;
  int level;
  UserInfo(this.nickname,this.level);
}

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HYButton(),
            HYText()
          ],
        ),
      ),
    );
  }
}

class HYButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("按钮"),
      onPressed: () {
        // 2. 发出事件
        final info = UserInfo("大哥", 20);
        eventBus.fire(info);
      },
    );
  }
}

class HYText extends StatefulWidget {
  @override
  _HYTextState createState() => _HYTextState();
}

class _HYTextState extends State<HYText> {
  String _message = "Hello";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 3. 监听
    eventBus.on<UserInfo>().listen((event) {
      print(event);
      setState(() {
        _message = "${event.nickname}-${event.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20),);
  }
}


