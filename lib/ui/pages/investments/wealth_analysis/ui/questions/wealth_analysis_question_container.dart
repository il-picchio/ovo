import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/investable_amount.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/liquidable_funds.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/salary.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/emergency_fund.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/spending_analysis.dart';

class WealthAnalysisQuestionContainer extends StatelessWidget {
  final int step;

  const WealthAnalysisQuestionContainer({super.key, required this.step});

  _getChild(int step) {
    switch (step) {
      case 0:
        return const WealthAnalysisInvestAmount();
      case 1:
        return const WealthAnalysisLiquidableFunds();
      case 2:
        return const WealthAnalysisSalary();
      case 3:
        return const WealthAnalysisSpending();
      
    }
    return const Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 0, end: (step + 1) / 10),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              color: Colors.indigo.shade100,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ),
        Expanded(
          child: Padding(
             padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.decelerate,
              switchOutCurve: Curves.fastOutSlowIn,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Column(
                key: ValueKey(step),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _getChild(step)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
