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
            child: Text("基础的widget")
        ),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton onClick"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(  // 凸起的button
          child: Text(
            "RaisedButton"
          ),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: () {  // 不传就不可以跟用户交互
            print("RaisedButton onClick");
          },
        ),
        // 2.FlatButton
        FlatButton(  // 扁平按钮
          child: Text("FlatButton"),
          color: Colors.orange,
          onPressed: () {
            print("FlatButton onClick");
          },
        ),
        // 3. OutLineButton
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton onClick"),
        ),
        // 4.FloatingActionButton
//        FloatingActionButton(
//
//        ),
        // 5.自定义button：图标-文字-背景-圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,  // 在主轴中占据
            children: [
              Icon(Icons.favorite, color: Colors.red,),
              Text("喜欢作者")
            ],
          ),
          onPressed: () => print("自定义button"),
        )

      ],
    );
  }
}

