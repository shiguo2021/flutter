import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureProvider<String>(
          //外面有一层Center的意思想表达Provider用在那里都行，不一定非要在根布局，当然根布局的范围最广
          initialData: '数据正在初始化...',
          create: (context) => fetchAddress(),
          child: Consumer<String>(
            builder: (context, value, child) {
              return Container(
                color: Colors.yellowAccent,
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Text(value),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.list,
                          size: 32,
                        ),
                        title: Text('我的订单'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<String> fetchAddress() {
    final address = Future.delayed(Duration(seconds: 5), () {
      return '1234 North Commercial Ave.';
    });

    return address;

    // await Future.delayed(Duration(seconds: 5));
    // return '1234 North Commercial Ave.';
  }
}
