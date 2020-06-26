import 'package:flutter/material.dart';
class HYAboutPage extends StatelessWidget {
  static const routeName = "/about";
  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            RaisedButton(
              child: Text("返回首页"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
