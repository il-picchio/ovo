import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ovo/ui/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ovo/ui/pages/card/card.dart';
import 'package:ovo/ui/pages/home/home.dart';
import 'package:ovo/ui/pages/investments/investments.dart';
import 'package:ovo/ui/pages/payments/payments.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 2;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 2);
    _pageController.addListener(() {
      final position = _pageController.position;
      if (position.userScrollDirection != ScrollDirection.idle) {
        setState(() {
          _index = (position.userScrollDirection == ScrollDirection.forward
                  ? _pageController.page?.toInt()
                  : _pageController.page?.ceil()) ??
              0;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageView(
        clipBehavior: Clip.none,
        controller: _pageController,
        children: const [
          PaymentsPage(),
          CardPage(),
          HomePage(),
          InvestmentsPage(),
          Text('test3'),
        ],
      ),
      bottomNavigationBar: OvoNavigationBar(
        currentIndex: _index,
        onTap: (val) {
          setState(() => _index = val);
          _pageController.animateToPage(val,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
