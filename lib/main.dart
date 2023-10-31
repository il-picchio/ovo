import 'package:flutter/material.dart';
import 'package:ovo/ui/home.dart';
import 'package:ovo/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ovoTheme,
      home: const MainPage(),
    );
  }
}
