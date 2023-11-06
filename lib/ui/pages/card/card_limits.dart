import 'package:flutter/material.dart';
import 'package:ovo/theme/elements/colors.dart';

class CardLimit extends StatelessWidget {
  final double limit;
  final double used;

  const CardLimit({super.key, required this.limit, required this.used});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = used * 100 ~/ limit;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20.0),
                          right: Radius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.grey.shade100, Colors.grey.shade300],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 100 - percentage,
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20.0),
                          right: Radius.circular(20.0),
                        ),
                        gradient: theme.extension<BrandColors>()!.gradient,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 100,
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              used.toStringAsFixed(2),
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              limit.toStringAsFixed(2),
              style: theme.textTheme.bodyMedium,
            )
          ],
        )
      ],
    );
  }
}
