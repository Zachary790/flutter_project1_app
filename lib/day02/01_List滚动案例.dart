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

class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HYHomeProductItem("Apple1", "Macbook1", "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg"),
        SizedBox(height: 6,),
        HYHomeProductItem("Apple2", "Macbook2", "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4018557288,1217151095&fm=26&gp=0.jpg"),
        SizedBox(height: 6,),
        HYHomeProductItem("Apple3", "Macbook3", "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg"),
      ],
    );
  }
}

  class HYHomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;
  final style1 = TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = TextStyle(fontSize: 20, color: Colors.green);
  HYHomeProductItem(this.title, this.desc, this.imageURL);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),  // 设置内边距
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,  // 设置边框的宽度
          color: Colors.pink,  // 设置边框颜色
        )
      ),  // 装饰
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: style1,),
          SizedBox(height: 8,),
          Text(desc, style: style2,),
          SizedBox(height: 8,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}




