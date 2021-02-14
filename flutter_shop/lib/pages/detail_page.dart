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
        title: Text(title, style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.tealAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('商品id:' + id),
        ),
      ),
    );
  }
}
