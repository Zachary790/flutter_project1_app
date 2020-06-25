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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("InheritedWidget")
        ),
      ),
      body: HYCounterWidget(
        counter: _counter,
        child: Column(
          children: [
            HYShowData01(),
            HYShowData02(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter ++;
          });
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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('执行了');
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Text("当前计数： ${HYCounterWidget.of(context).counter}"),
    );
  }
}
class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text("当前计数：${HYCounterWidget.of(context).counter}"),
    );
  }
}


class HYCounterWidget extends InheritedWidget {
  final int counter ;

  HYCounterWidget({this.counter, Widget child}): super(child: child);

  static HYCounterWidget of(BuildContext context) {
    // 作用是沿着我们的element树找最近的HYCounterElement， 取出widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }
  // true：执行以来当前的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(HYCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }

}
