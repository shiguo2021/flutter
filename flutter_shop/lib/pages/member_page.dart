import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('会员中心' + context.watch<Counter>().value.toString()),
      ),
    );
  }
}
