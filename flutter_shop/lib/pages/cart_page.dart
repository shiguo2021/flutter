import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Number(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<Counter>(context).value;

    return Container(
      margin: EdgeInsets.only(top: 200),

      child: Text(
        '${context.watch<CounterProvider>().name}${Provider.of<CounterProvider>(context).value}',
        style: Theme.of(context).textTheme.caption,
      ),

      // child: FutureProvider<String>(
      //   //外面有一层Center的意思想表达Provider用在那里都行，不一定非要在根布局，当然根布局的范围最广
      //   initialData: '数据正在初始化...',
      //   create: (context) => fetchAddress,

      // ),
    );
  }

  Future<String> get fetchAddress {
    final address = Future.delayed(Duration(seconds: 2), () {
      return '1234 North Commercial Ave.';
    });

    return address;
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          context.read<CounterProvider>().add();
          // Provider.of<Counter>(context).add();
        },
        child: Text('递增'),
      ),
    );
  }
}
