import 'package:flutter/material.dart';
class HYSubjectContent extends StatefulWidget {
  @override
  _HYSubjectContentState createState() => _HYSubjectContentState();
}

class _HYSubjectContentState extends State<HYSubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("书影音内容", style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}
