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
    return Text.rich(
        TextSpan(
//          text: "Hello World",
//          style: TextStyle(
//            color: Colors.red,
//            fontSize: 20
//          )
          children: [
            TextSpan(
              text: "Hello World",
              style: TextStyle(
                color: Colors.red
              )
            ),
            TextSpan(
                text: "Hello flutter",
                style: TextStyle(
                    color: Colors.green
                )
            ),
            WidgetSpan(
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              )
            ),
            TextSpan(
                text: "Hello dart",
                style: TextStyle(
                    color: Colors.blue
                )
            )
          ]
        )
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World",
      textAlign: TextAlign.center,  // 文本居中
      maxLines: 2,  // 文本最多行
      overflow: TextOverflow.ellipsis,  // 文尾显示省略号
      textScaleFactor: 1.5,  // 缩放1.5倍
      style: TextStyle(
          fontSize: 30,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }

}




