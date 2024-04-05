import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/home/app_bar/chart/chart.dart';

class HomeAppBar extends StatelessWidget {
  final double animationControllerValue;
  final Widget child;

  const HomeAppBar({
    super.key,
    required this.animationControllerValue,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Patrimonio totale'),
        centerTitle: true,
      ),
      body: Background(
        decorations: Decorations.home(context),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          (1 - animationControllerValue / 2),
                      child: Text(
                        'CHF 2\'000\'000.54',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: animationControllerValue,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Chart(
                            investments: 140000.54,
                            account: 600000,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 30,
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Center(child: child),
            )
          ],
        ),
      ),
    );
  }
}
