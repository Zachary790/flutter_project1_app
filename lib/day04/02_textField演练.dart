import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("基础的widget")
        ),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton onClick"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Theme(
        data: ThemeData(
          primaryColor: Colors.red
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(  // 输入框
                controller: usernameTextEditController,
                decoration: InputDecoration(
                  labelText: "username",  // 提示文本
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.red[100]
                ),
                onChanged: (value) {
                  print("onChange$value");
                },// 给输入框装饰
                onSubmitted: (value) {
                  print("onSubmitted$value");
                },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordTextEditController,
                decoration: InputDecoration(
                  labelText: "password",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,  // 填充父容器
                height: 40,
                child: FlatButton(
                  child: Text(
                    "登 录",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    final username = usernameTextEditController.text;
                    final password = passwordTextEditController.text;
                    print("账号：$username 密码：$password");
                    usernameTextEditController.text = "";
                    passwordTextEditController.text = "";
                  },
                ),
              )
            ],
          ),
        ),
      );
  }
}


