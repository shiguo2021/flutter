import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabs_bottom_provider.dart';
import 'app.model.dart';

class ProviderStore extends StatelessWidget {
  Widget child;
  ProviderStore({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TabsBottomProvider()),
        ChangeNotifierProvider(create: (_) => AppModelProvider())
      ],
      child: child,
    );
  }
}
