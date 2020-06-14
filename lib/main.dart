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
//    return ImageDemo01(imageURL: "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3669917020,2046613997&fm=26&gp=0.jpg",);
//    return Image.network("https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3669917020,2046613997&fm=26&gp=0.jpg");
//    return Image(
//      // 1. 在flutter项目中创建文件夹
//      // 2.在pubspec.yaml进行配置
//      image: AssetImage("assets/images/11.jpg"),
//    );
      return Image.asset("assets/images/11.jpg");
  }
}

class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Image(
      color: Colors.green,
      colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(
        imageURL,
      ),
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      repeat: ImageRepeat.repeat,
//      alignment: Alignment.topCenter,
      // 范围：-1，1
      alignment: Alignment(0, 0),
    );
  }

}


