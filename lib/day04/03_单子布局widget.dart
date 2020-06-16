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
      return Container(
//        color: Colors.red,
        width: 200,
        height: 200,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        child: Icon(
          Icons.pets,
          size: 50,
          color: Colors.white,
        ),
        transform: Matrix4.rotationZ(0),
        decoration: BoxDecoration(  // 和color冲突
          color: Colors.red,
          border: Border.all(
            width: 5,
            color: Colors.purple
          ),
          borderRadius: BorderRadius.circular(100),  // 设置圆角
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10,10),
              spreadRadius: 5,  // 衍生
              blurRadius: 10,  // 模糊度
            )
          ]
        ),
      );
  }
}

class PaddingDemo extends StatelessWidget{
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),  // const可以去除
      child: Text("你好啊，小明",style: TextStyle(fontSize: 30),),
    );
  }

}

class AlignDemo extends StatelessWidget{
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(  // == Align
      alignment: Alignment(1,1),
      widthFactor: 5,  //child的宽的倍数
      heightFactor: 5,  //child的高的倍数
      child: Icon(
        Icons.pets,
        size: 50,
      ),
    );
  }

}


