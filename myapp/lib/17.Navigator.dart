import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: '导航演示01', home: new FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航页面')),
      body: Center(
        child: RaisedButton(
          child: Text('查看商品详情页'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (contxt) => new SecondScreen()));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('技术胖商品详情页'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
