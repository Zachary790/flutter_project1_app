import 'package:flutter/material.dart';
import 'mall_content.dart';
class HYMallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("市集")),
      ),
      body: HYMallContent(),
    );
  }
}
