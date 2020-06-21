import 'package:flutter/material.dart';
import 'subject_content.dart';
class HYSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("我的")),
      ),
      body: HYSubjectContent(),
    );
  }
}
