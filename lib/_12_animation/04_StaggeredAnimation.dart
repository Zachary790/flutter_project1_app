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

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller ;
  Animation animation;
  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

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
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    _controller.addListener(() {
      setState(() {

      });
    });
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
    /**
     * 大小的变化
     * 颜色的变化
     */
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("列表测试")
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child){
            return Opacity(
              opacity: _opacityAnim.value,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnim.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnim.value,
                  height: _sizeAnim.value,
                  color: _colorAnim.value,
                ),
              ),
            );
          },
        )

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