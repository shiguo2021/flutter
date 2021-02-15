import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_provider.dart';
import '../provider/counter_provider.dart';
import 'package:flutter_shop/provider/goods_detail_provider.dart';

class ProviderStore extends StatelessWidget {
  Widget child;
  ProviderStore({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        // Provider<Counter>(create: (_) => Counter()),
        ChangeNotifierProvider.value(value: CounterProvider()),
        // ChangeNotifierProvider.value(value: CategoryChild()), //有用
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        // Provider<CategoryChild>.value(value: cc)
        ChangeNotifierProvider.value(value: GoodsDetailProvider()),
      ],
      child: child,
    );
  }
}
