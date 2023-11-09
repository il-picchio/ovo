import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background_decoration.dart';
import 'package:ovo/ui/common/background/position.dart';

class Background extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final List<Position> decorations;

  const Background(
      {super.key,
      required this.child,
      required this.decorations,
      this.padding = const EdgeInsets.all(0.0)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...decorations.map(
          (decoration) => Positioned(
            top: decoration.top,
            left: decoration.left,
            right: decoration.right,
            bottom: decoration.bottom,
            child: const BackgroundDecoration(),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
