import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.orange,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 100),
          child: InkWell(
            onTap: () {
              print('123');
            },
            child: Text(
              '进入应用',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
