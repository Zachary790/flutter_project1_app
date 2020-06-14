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
      // Icon字体图标和图片图标
      // 1.字体图标矢量图
      // 2.可以设置颜色
      // 3.突变很多时，占据空间更小
//      return Icon(
//        Icons.pets
//      );
//      return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'));
      // 1.unicode编码
      // 2.设置对应的字体
      return Text("\ue91d", style: TextStyle(
        fontSize: 20,
        color: Colors.orange,
        fontFamily: 'MaterialIcons'
      ),);
  }
}

class ImageExtensionDemo extends StatelessWidget {
  // 1.占位图的问题
  // 2.图片缓存：最多默认1000张  100m
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fadeOutDuration: Duration(milliseconds: 1),
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: AssetImage("assets/images/11.jpg"),
        image: NetworkImage(
          "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3669917020,2046613997&fm=26&gp=0.jpg",
        )
    );
  }
}


class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 1.默认情况下button上下有一定的间距
    // 2.button变小:ButtonTheme有默认minWidth
    // 3。去除button的内边距
    return Column(
      children: [
        ButtonTheme(
          minWidth: 30,
          height: 30,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.red,
            child: Text("Flat Button1"),
            textColor: Colors.white,
            onPressed: () {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}

