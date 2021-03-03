import 'package:flutter/material.dart';
import '../../index.dart';

class GridView_widget extends StatelessWidget {
  String title;
  GridView_widget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 4,
          children: List(200).asMap().keys.map((key) {
            return Column(
              children: [
                Expanded(
                  child: Placeholder(),
                ),
                Text('$key',
                    style: TextStyle(
                      color: Colors.primaries[key % Colors.primaries.length],
                    )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
