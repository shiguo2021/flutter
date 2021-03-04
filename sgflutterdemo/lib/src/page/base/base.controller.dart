import 'package:flutter/material.dart';

abstract class Base_controller extends StatelessWidget {
  String title;
  Base_controller({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: initViews(context),
    );
  }

  Widget initViews(BuildContext context);
}
