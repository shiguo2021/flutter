import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String title;

  DetailPage({
    this.id,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: Text('商品id:' + id),
        ),
      ),
    );
  }
}
