import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background_decoration.dart';
import 'package:ovo/ui/common/background/position.dart';

class Background extends StatelessWidget {
  final EdgeInsets padding;
  final List<Widget> children;
  final List<Position> decorations;
  final MainAxisAlignment alignment;

  const Background(
      {super.key,
      required this.children,
      required this.decorations,
      this.padding = const EdgeInsets.all(0.0),
      this.alignment = MainAxisAlignment.start
    });

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
          minimum: const EdgeInsets.only(top: 30.0),
            child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: alignment,
            children: children,
          ),
        ))
      ],
    );
  }
}
