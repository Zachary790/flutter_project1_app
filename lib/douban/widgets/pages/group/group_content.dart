import 'package:flutter/material.dart';
class HYGroupContent extends StatefulWidget {
  @override
  _HYGroupContentState createState() => _HYGroupContentState();
}

class _HYGroupContentState extends State<HYGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("小组内容", style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}
