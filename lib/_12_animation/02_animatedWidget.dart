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

class _HYHomePageState extends State<HYHomePage> with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller ;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    // 2.设置Curve的值
    animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut
    );
    // 3.Tween
    animation = Tween(begin: 50.0, end: 80.0).animate(animation);
    // 2.监听动画值的改变
//    _controller.addListener(() {
//      setState(() {
//
//      });
//    });
    // 监听动画的状态的改变
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
      else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("列表测试")
        ),
      ),
      body: Center(
        child: HYAnimatedIcon(animation)
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          }else if (_controller.status == AnimationStatus.forward){
            _controller.forward();
          }else if (_controller.status == AnimationStatus.reverse){
            _controller.reverse();
          }else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

class HYAnimatedIcon extends AnimatedWidget {
  HYAnimatedIcon(Animation anim): super(listenable: anim);
  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: animation.value,);
  }

}

/**
 * 1.Animation：抽象类
 *  * 监听动画值的改变
 *  * 监听动画状态的改变
 *  * value
 *  * status
 * 2.AnimationController继承自Animation
 *  * vsync：同步信号 (this -> with SingleTickerProviderStateMixin)
 *  * forward :向前执行动画
 *  * reverse：反转执行动画
 * 3. CurVedAnimation：
 *  * 作用： 设置动画执行的速率
 * 4.Tween：设置动画执行的value范围
 *  * begin:开始值
 *  * end“结束
 */