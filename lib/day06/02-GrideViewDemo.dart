import 'dart:math';

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
      body: GridViewDemo4(),
    );
  }
}

class GridViewDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,  // 宽高比
          crossAxisSpacing: 8,  // 交叉轴距离宽
          mainAxisSpacing: 8,  // 主轴距离宽
        ),
        itemBuilder: (BuildContext content, int index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        },
      ),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,  // 宽高比
        crossAxisSpacing: 8,  // 交叉轴距离宽
        mainAxisSpacing: 8,  // 主轴距离宽
        children: List.generate(100, (index) {
          return Container(
            color: Colors.red,
          );
        })
      ),
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.8
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,  // 宽高比
          crossAxisSpacing: 8,  // 交叉轴距离宽
          mainAxisSpacing: 8,  // 主轴距离宽
        ),
        children: List.generate(100, (index) {
           return Container(
             color: Colors.red,
           );
        }),
      ),
    );
  }
}
