import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Application Name',
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      routerConfig: Modular.routerConfig,
    );
  }
}
