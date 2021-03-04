import 'package:flutter/material.dart';
import 'package:sgflutterdemo/src/app.dart';
import 'package:provider/provider.dart';
import 'package:sgflutterdemo/src/provider/AppModel.dart';

void main() {
  runApp(ProviderStore(child: AppPage()));
}

class ProviderStore extends StatelessWidget {
  Widget child;
  ProviderStore({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppModel()),
      ],
      child: child,
    );
  }
}
