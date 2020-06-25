import 'package:flutter/material.dart';
import 'package:flutterproject1app/day09/model/UserInfo.dart';
import 'package:flutterproject1app/day09/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

import 'viewmodel/counter_view_model.dart';

/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其他位置使用共享的数据
 *  * provider.of : 当provider的数据发生改变provider。of中的build方法都会重新build
 *  * Consumer（相对推荐）： 当provider的数据发生改变，只会执行Consumer
 *  * selector：
 *    * selector方法（对原有的数据进行转换）
 *    * shouldRebuild（要不要重新构建）
 */
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => HYCounterViewModel()
        ),
        ChangeNotifierProvider(
          create: (ctx) => UserViewModel(UserInfo("why",20,"url"))
        )
      ],
      child: MyApp(),
    )
  );
//  runApp(
//    ChangeNotifierProvider(
//      create: (ctx) => HYCounterViewModel(),
//      child: ChangeNotifierProvider(
//        create: (ctx) => UserViewModel(UserInfo("why",20,"url")),
//        child: MyApp(),
//      ),
//    )
//  );
}

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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("InheritedWidget")
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HYShowData01(),
            HYShowData02(),
            HYShowData03(),
          ],
        ),
      ),
      floatingActionButton: Selector<HYCounterViewModel,HYCounterViewModel>(
        child: Icon(Icons.add),
        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => false,  // 要不要重新构建
        builder: (ctx, counterVM, child) {
          return FloatingActionButton(
            child: child,
            onPressed: () {
//              setState(() {
                counterVM.counter += 1;
//              });
            },
          );
        },
      ),
    );
  }
}

class HYShowData01 extends StatefulWidget {
  @override
  _HYShowData01State createState() => _HYShowData01State();
}

class _HYShowData01State extends State<HYShowData01> {
  @override
  Widget build(BuildContext context) {
    // 3.
    int counter = Provider.of<HYCounterViewModel>(context).counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数：$counter"),
    );
  }
}

class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Consumer<HYCounterViewModel>(
        builder: (ctx, counterVM, child){
          return Text("当前计数：${counterVM.counter}");
        },
      ),
    );
  }
}

class HYShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (ctx, counterVM, child){
        return Text("当前计数：${counterVM.user.nickname}");
      },
    );
  }
}