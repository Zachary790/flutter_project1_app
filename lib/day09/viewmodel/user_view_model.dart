import 'package:flutter/material.dart';
import 'package:flutterproject1app/day09/model/UserInfo.dart';

class UserViewModel extends ChangeNotifier {
  UserInfo _user;
  UserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
  }
}