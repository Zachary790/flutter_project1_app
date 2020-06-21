import 'package:flutter/material.dart';
class HYProfileContent extends StatefulWidget {
  @override
  _HYProfileContentState createState() => _HYProfileContentState();
}

class _HYProfileContentState extends State<HYProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我的内容", style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}
