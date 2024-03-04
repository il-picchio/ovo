import 'package:flutter/material.dart';
import 'package:ovo/core/routes/routes_map.dart';
import 'package:ovo/core/theme/light/theme.dart';

class OvoMaterialApp extends StatelessWidget {
  const OvoMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ovo',
      routes: routesMap,
      initialRoute: '/',
      theme: ovoLightTheme,
    );
  }
}
