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
          child: Text("商品列表"),
        ),
      ),
      body: HYHomeContent("你好啊，哈哈哈哈"),
    );
  }
}

/**
 * Widget不加 _: 暴露给别人使用的
 */
class HYHomeContent extends StatefulWidget {
  final String message;
  HYHomeContent(this.message);
  @override
  State<StatefulWidget> createState() {
    return _HYHomeContentState();
  }

}
/**
 * 为什么Fluterr在设计的时候放在StateFulWidget的build方法放在State
 * 1.build出来的widget是需要依赖state中的变量的
 * 2.在fultter的运行过程中：
 *    widget是不断的销毁和创建的，
 *    当我们自己的状态改变的时候，并不希望重新创建一个state
 * State加 _: 不暴露给别人使用的
 */
class _HYHomeContentState extends State<HYHomeContent> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _geButtons(),
          Text("当前计算：$_counter"),
          Text("传递的信息：${widget.message}")
        ],
      ),
    );
  }

  /**
   * 获取按钮的方法
   */
  Widget _geButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Icon(Icons.add),
          color: Colors.pink,
          onPressed: (){
            setState(() {
              _counter++;
            });
          },
        ),
        RaisedButton(
          child: Icon(Icons.remove),
          color: Colors.purple,
          onPressed: (){
            setState(() {
              _counter--;
            });
          },
        ),
      ],
    );
  }
}



