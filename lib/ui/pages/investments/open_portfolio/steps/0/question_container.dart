import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

import '__mock/questions.dart';

class QuestionContainer extends StatefulWidget {
  final void Function(int) onFinish;
  final void Function(double) onProgress;

  const QuestionContainer({super.key, required this.onFinish, required this.onProgress});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  static final _maxStep = questions.length - 1;

  int _step = 0;

  final Map<int, int> _points = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final question = questions[_step];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.decelerate,
      switchOutCurve: Curves.fastOutSlowIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Card(
        elevation: 20,
        key: ValueKey(_step),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Text(
                  question.question,
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...question.answers.mapIndexed(
                (index, answer) => ListTile(
                  onTap: () {
                    _points.containsKey(_step)
                        ? _points.update(_step, (value) => answer.points)
                        : _points.putIfAbsent(_step, () => answer.points);
                    if (_step < _maxStep) {
                      setState(() => _step++);
                      widget.onProgress(_step/_maxStep);
                      return;
                    }
                    print(_points.values.sum);
                    widget.onFinish(_points.values.sum);
                  },
                  leading: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: theme.extension<BrandColors>()!.tertiary,
                      shape: BoxShape.circle,
                    ),
                    child: Text((index + 1).toString()),
                  ),
                  title: Text(
                    answer.text,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              if (_step != 0)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    onPressed: () {
                      _points.remove(_step);
                      setState(() => _step--);
                      widget.onProgress(_step/_maxStep);
                    },
                    child: Text('Previous question'),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
