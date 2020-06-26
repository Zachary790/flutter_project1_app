import 'package:flutter/material.dart';
class HYDetailPage extends StatelessWidget {
  final String _message;
  HYDetailPage(this._message);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // true:当返回为true时，可以自动返回
        // false：自行写返回代码
        _backToHome(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
//        leading: IconButton(
//          icon: Icon(Icons.backspace),
//          onPressed: () => _backToHome(context),
//        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message),
              RaisedButton(
                child: Text("回到首页"),
                onPressed: () => _backToHome(context),
              )
            ],
          )
        ),
      ),
    );
  }
  void _backToHome(BuildContext context){
    print('回到首页');
    Navigator.pop(context,"a detail message");
  }
}
