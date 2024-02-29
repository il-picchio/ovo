import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/theme/elements/colors.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/0/step_0.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/step_1.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/steps/step_2.dart';

class OpenPortfolioPage extends StatefulWidget {
  const OpenPortfolioPage({super.key});

  @override
  State<OpenPortfolioPage> createState() => _OpenPortfolioPageState();
}

class _OpenPortfolioPageState extends State<OpenPortfolioPage> {
  _getStep({required BuildContext context, required int step}) {
    switch (step) {
      case 0:
        return PortfolioOpenStep0(
            onProceed: () => setState(() => _step++),
            onProgress: (progress) => setState(() => _progress = progress));
      case 1:
        return PortfolioOpenStep1(
            onProceed: () => setState(() {
                  _step++;
                  _progress = 2;
                }));
      case 2:
        return PortfolioOpenStep2();
      default:
        throw ArgumentError.value(step, 'No Step found');
    }
  }

  int _step = 0;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BrandColors>()!;

    return WillPopScope(
      onWillPop: () {
        if (_step == 0) {
          return Future.value(true);
        }
        setState(() {
          _step--;
          _progress = _step.floorToDouble();
        });
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: _step > 0,
          backgroundColor: Colors.transparent,
          title: Text('Open portfolio'),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.xmark),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
        body: Background(
          decorations: Decorations.investments(context),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween<double>(begin: 0, end: _progress),
                    builder: (context, value, child) => LinearProgressIndicator(
                      value: (value) / 3,
                      color: Colors.indigo.shade100,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _getStep(context: context, step: _step),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
