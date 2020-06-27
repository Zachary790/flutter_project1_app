import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 1。一旦设置了主题，那么应用程序中的某些widget，就会直接使用主题的样式
     * 2。可以通过Theme.of（context）.textTheme.display2
     */
    return MaterialApp(
      title: 'Flutter Demo',  // 对android有用，IOS无用，
      theme: ThemeData(
        // 亮度
        brightness: Brightness.light,
        // 2 传入的是MaterialColor
        primarySwatch: Colors.blue,  // 设置这个包含了（primaryColor和accentColor）
        // 3.primaryColor：导航和TabBar的颜色
        primaryColor: Colors.orange,
        // 4.accentColor:单独设置FloatingActionButton/switch
        accentColor: Colors.green,
        // 5.Button的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow
        ),
        // 6.card的主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10,
        ),
        // 7.Text的主题
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 16),
          body2: TextStyle(fontSize: 20),
        )
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
      body: Center(
        child: Column(
          children: [
            Text("Hello"),
            Text("Hello", style: TextStyle(fontSize: 14),),
            Text("Hello", style: Theme.of(context).textTheme.body2,),
            Switch(
              value: true,
              onChanged: (value) {},
            ),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.red,
            ),
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: () {},
            ),
            Card(
              child: Text("你好啊",style: TextStyle(fontSize: 50),),
            )
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text("首页"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text("分类"),
              icon: Icon(Icons.border_left)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) {
              return HYDetailPage();
            }
          ));
        },
      ),
    );
  }
}


class HYDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Theme(
      // 拷贝了一个过去之后传入特殊的，会进行覆盖
      data: Theme.of(context).copyWith(
        primaryColor: Colors.purple
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: Center(
          child: Text("detail"),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.pink
            )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}
