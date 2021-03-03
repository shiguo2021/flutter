import 'package:flutter/material.dart';

abstract class Base_controller extends StatelessWidget {
  String title;
  Base_controller({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: initViews(context),
    );
  }

  Widget initViews(BuildContext context);
}
