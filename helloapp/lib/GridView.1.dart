import 'package:flutter/material.dart';

void main() => runApp(MyApp(
));

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              title: new Text('ListView widget 网格列表'),
            ),
            body: GridView.count(
              padding: const EdgeInsets.all(20),
              
              //每个网络的间距
              crossAxisSpacing:10.0,
              crossAxisCount: 3,
              children: <Widget>[
                const Text('I am JSPang 01',style: TextStyle(color: Colors.red),),
                 const Text('I am JSPang 02'),
                  const Text('I am JSPang 03'),
                   const Text('I am JSPang 04'),
                    const Text('I am JSPang 05'),
                     const Text('I am JSPang 06'),
              ],
            )
        )
    );
  }
}
