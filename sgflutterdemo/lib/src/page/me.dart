import 'package:flutter/material.dart';
import '../index.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Application.router.navigateTo(context, 'login');
            },
            child: Text('退出登录'),
          ),
        ),
      ),
    );
  }
}
