import 'package:flutter/material.dart';
class HYMallContent extends StatefulWidget {
  @override
  _HYMallContentState createState() => _HYMallContentState();
}

class _HYMallContentState extends State<HYMallContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("市集内容", style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}
