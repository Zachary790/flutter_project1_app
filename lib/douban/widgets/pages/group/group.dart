import 'package:flutter/material.dart';
import 'group_content.dart';
class HYGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("小组")),
      ),
      body: HYGroupContent(),
    );
  }
}
