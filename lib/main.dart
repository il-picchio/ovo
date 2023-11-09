import 'package:flutter/material.dart';
import 'package:ovo/ui/home.dart';
import 'package:ovo/theme/light/theme.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/open_portfolio.dart';

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
      routes: Map.of({
        '/': (context) => const MainPage(),
        '/open-portfolio': (context) => const OpenPortfolioPage()
      }),
      initialRoute: '/',
      theme: ovoLightTheme
    );
  }
}
