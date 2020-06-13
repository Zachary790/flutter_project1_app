import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          child: Text("商品列表"),
        ),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContentLess extends StatelessWidget {
  final String message;

  HYHomeContentLess(this.message) {
    print("构造函数被调用");
  }
  @override
  Widget build(BuildContext context) {
    print("被调用build方法");
    return Text(message);
  }
}

/**
 * StatefulWidget的生命周期
 */
class HYHomeContent extends StatefulWidget {
  HYHomeContent() {
    print("1.调用HYHomeContent的constructor方法");
  }
  @override
  _HYHomeContentState createState() {
    print("2.调用HYHomeContent的createState方法");
    return _HYHomeContentState();
  }
}

class _HYHomeContentState extends State<HYHomeContent> {
  int _counter = 0;
  _HYHomeContentState() {
    print("3.调用_HYHomeContentState的constructor方法");
  }

  @override
  void initState() {
    // 强调：这里是必须调用super
    super.initState();
    print("4.调用_HYHomeContentState的initState方法");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("调用_HYHomeContentState的didChangeDependencies方法");
  }

  @override
  void didUpdateWidget(HYHomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("5.调用_HYHomeContentState的build方法");
    return Column(
      children: [
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              _counter++;
            });
          },
        ),
        Text("数字：$_counter")
      ],
    );
  }
  // 销毁的时候调用
  @override
  void dispose() {
    super.dispose();
    print("6.调用_HYHomeContentState的dispose方法");
  }
}



