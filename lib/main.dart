import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/routing/app_routing.dart';

void main() {
  //remove # from url
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouting,
    );
  }
}