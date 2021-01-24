import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              title: new Text('ListView widget 网格列表'),
            ),
            body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.0, //主轴的间距
                crossAxisSpacing: 2.0, //横轴的间距
                childAspectRatio: 0.7, //宽高比
              ),
              children: <Widget>[
                new Image.network(
                    'http://img5.mtime.cn/mg/2019/10/11/142700.74582532_285X160X4.jpg',
                    fit: BoxFit.cover),
                new Image.network(
                    'http://img5.mtime.cn/mg/2019/10/11/141812.78837778_285X160X4.jpg',
                    fit: BoxFit.cover),
                Image.network(
                    'http://img5.mtime.cn/mg/2019/10/11/141627.15551770_285X160X4.jpg',
                    fit: BoxFit.cover),
                Image.network(
                  'http://img5.mtime.cn/mg/2019/10/11/130908.94954155_285X160X4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'http://img5.mtime.cn/mg/2019/10/11/114240.46183941_285X160X4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'http://img5.mtime.cn/mg/2019/10/11/114554.77960310_285X160X4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'http://img5.mtime.cn/mg/2019/10/11/141627.15551770_285X160X4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'http://img5.mtime.cn/mg/2019/10/11/115105.14036573_280X138X4.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            )));
  }
}
