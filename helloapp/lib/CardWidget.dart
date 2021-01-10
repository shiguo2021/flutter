import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var card = new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('吉林省昌邑区',style:TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('技术胖12314123424332342'),
            leading:new Icon(Icons.account_box,color: Colors.lightBlue,),//联系人图标
          ),
          new Divider(),
          ListTile(
            title: Text('北京市海定区中国科技大学',style:TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('技术胖12314123424332342'),
            leading:new Icon(Icons.account_box,color: Colors.lightBlue,),//联系人图标
          ),
          new Divider(),
          ListTile(
            title: Text('海南市蒲元',style:TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('技术胖12314123424332342'),
            leading:new Icon(Icons.account_box,color: Colors.lightBlue,),//联系人图标
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Row Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('卡片布局组件'),

        ),
        body: Center(
          child: card,
        )
      ),
    );
  }
}
