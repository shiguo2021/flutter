import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter.dart';
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
        '${context.watch<Counter>().name}${Provider.of<Counter>(context).value}',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          context.read<Counter>().add();
          // Provider.of<Counter>(context).add();
        },
        child: Text('递增'),
      ),
    );
  }
}
