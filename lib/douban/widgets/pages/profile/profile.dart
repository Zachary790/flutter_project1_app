import 'package:flutter/material.dart';
import 'profile_content.dart';
class HYProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("我的")),
      ),
      body: HYProfileContent(),
    );
  }
}
