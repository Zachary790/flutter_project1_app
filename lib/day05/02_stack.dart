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
//     MediaQuery.of(context).size.width;  //  获取屏幕的宽度

     return RowDome2();
  }
}

class RowDome2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * stack默认的大小是包裹内容
     * - alignment:从什么位置开始排布所有的子widget
     * - fit：expand  将子元素拉伸到尽可能大
     * - overflow:超出部分如何处理
     *
     * positioned
     */
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        Container(width: 150, height: 150, color: Colors.red,),
        Image.asset("assets/images/11.jpg", width: 300,),
        Positioned(  // 定位
            right: 0,
            child: Text("进击的巨人", style: TextStyle(color: Colors.white),)
        )
      ],
    );
  }
}

class ButtonRowDemo extends StatelessWidget{
  const ButtonRowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child:
      Row(
        children: [
          Icon(Icons.bug_report),
          Text("bug报告"),
        ],
      ),
      onPressed: () => print(""),
    );
  }

}

// Expanded
class RowDemo1 extends StatelessWidget {
  // Row/Column：继承自Flex
  // Flex CSS Flex布局,直接使用的较少
  /**
   * Axis.horizontal == Row
   * Axis.vertical == Column
   *
   * Row特点：
   * - 水平方向尽可能占据比较大的空间
   *   * 水平也是希望包裹内容，那么设置mainAxisSize = min
   * - 垂直方向包裹内容
   *
   *
   * mainAxisAlignment:
   * -start:沿着主轴的开始位置挨个排列  (默认值)
   * -end:沿着主轴的结束位置挨个排列
   * -center:主轴的中心点对齐
   * -spaceBetween：左右两边的间距为0，其他元素之间平分间距
   * -spaceAround:左右两边的间距是其他元素之间的间距的一半
   * -spaceEvenly：所有的间距平分空间
   *
   * crossAxisAlignment：
   * -start:沿着交叉轴的开始位置对齐
   * -end:沿着交叉轴的结束位置对齐
   * -center:交叉轴的中心点对齐  (默认值)
   * -baseline：基线对齐  要设置 TextBaseline(必须有文本的时候才起效果)
   * -stretch:先Row占据交叉轴尽可能大的空间，将所有的ziwidget交叉轴的高度，拉伸到最大
   * -spaceEvenly：所有的间距平分空间
   */
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        /**
         * Flexible中的属性：
         * -flex
         * Expanded-》Flexible(fit:FlexFix:tight)
         */
        Expanded(
            flex: 1,
            child: Container(width: 80, height: 60, color: Colors.red,)
        ),
        Expanded(
            flex: 1,
            child: Container(width: 120, height: 100, color: Colors.green,)
        ),
        Container(width: 90, height: 80, color: Colors.blue,),
        Container(width: 50, height: 120, color: Colors.orange,),
      ],
    );
  }
}

// 基本使用
class RowDemo extends StatelessWidget {
  // Row/Column：继承自Flex
  // Flex CSS Flex布局,直接使用的较少
  /**
   * Axis.horizontal == Row
   * Axis.vertical == Column
   *
   * Row特点：
   * - 水平方向尽可能占据比较大的空间
   *   * 水平也是希望包裹内容，那么设置mainAxisSize = min
   * - 垂直方向包裹内容
   *
   *
   * mainAxisAlignment:
   * -start:沿着主轴的开始位置挨个排列  (默认值)
   * -end:沿着主轴的结束位置挨个排列
   * -center:主轴的中心点对齐
   * -spaceBetween：左右两边的间距为0，其他元素之间平分间距
   * -spaceAround:左右两边的间距是其他元素之间的间距的一半
   * -spaceEvenly：所有的间距平分空间
   *
   * crossAxisAlignment：
   * -start:沿着交叉轴的开始位置对齐
   * -end:沿着交叉轴的结束位置对齐
   * -center:交叉轴的中心点对齐  (默认值)
   * -baseline：基线对齐  要设置 TextBaseline(必须有文本的时候才起效果)
   * -stretch:先Row占据交叉轴尽可能大的空间，将所有的ziwidget交叉轴的高度，拉伸到最大
   * -spaceEvenly：所有的间距平分空间
   */
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       textDirection: TextDirection.rtl,  更改主轴从右往左对Row起效果
//      verticalDirection: VerticalDirection.down,更改主轴从下往上对Column起效果
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        Container(
          width: 80, height: 60, color: Colors.red,
          child: Text("Hello", style: TextStyle(
            fontSize: 20
          ),),
        ),
        Container(width: 120, height: 100, color: Colors.green,),
        Container(width: 90, height: 80, color: Colors.blue,),
        Container(width: 50, height: 120, color: Colors.orange,),
      ],
    );
  }
}



