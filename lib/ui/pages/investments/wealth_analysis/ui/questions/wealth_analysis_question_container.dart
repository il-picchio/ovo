import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';

class WealthAnalysisQuestionContainer extends StatelessWidget {
  final QuestionId id;
  final Widget child;

  const WealthAnalysisQuestionContainer(
      {super.key, required this.id, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            tween: Tween<double>(
                begin: 0,
                end: (QuestionId.values.indexOf(id) + 1) /
                    QuestionId.values.length),
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
                key: ValueKey(id),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
