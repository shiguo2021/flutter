import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: new AppBar(
        title: new Text('ListView widget'),
      ),
      body: new ListView(
        children: <Widget>[
          // new ListTile(
          //   leading: new Icon(Icons.perm_camera_mic),
          //   title: new Text('perm_camera_mic'),

          // ),
          //  new ListTile(
          //   leading: new Icon(Icons.add_call),
          //   title: new Text('add_call'),
          // ),
          //  new ListTile(
          //   leading: new Icon(Icons.access_time),
          //   title: new Text('access_time'),
          // )

          new Image.network(
              'https://i0.hdslb.com/bfs/sycp/creative_img/201910/32fbf2779b009f757097799437d3aa1e.jpg'),
          new Image.network(
              'https://i0.hdslb.com/bfs/sycp/creative_img/201910/ee20fc166769cf91bd33286cc5037f4c.jpg'),
          new Image.network(
              'https://i0.hdslb.com/bfs/sycp/creative_img/201909/2b28a00281cedec1a1a78b805df1452c.jpg')
        ],
      ),
    ));
  }
}
