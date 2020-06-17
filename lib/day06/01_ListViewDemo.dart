import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext ctx, int index) {
          print('$index');
          return Text("Hello World: $index", style: TextStyle(fontSize: 30),);
        },
        separatorBuilder:(BuildContext ctx, int index) {
          return Divider(
            color: Colors.red,
            indent: 30,
            endIndent: 30,
            thickness: 10,  // 增加行粗
            height: 1,  // 设置这个分割线的高度
          );
        } ,
      ),
    );
  }
}

class ListViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60,  // 设置行高
      itemBuilder: (BuildContext ctx, int index) {
        print('$index');
        return Text("Hello World: $index", style: TextStyle(fontSize: 30),);
      },
    );
  }
}


class ListViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
//        reverse: true,  // 反转
//      scrollDirection: Axis.horizontal,  // 设置水平
//      itemExtent: 100,  item的高度
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index+1}"),
          subtitle: Text("联系人电话号码：1233"),
        );
      }),
    );
  }
}

