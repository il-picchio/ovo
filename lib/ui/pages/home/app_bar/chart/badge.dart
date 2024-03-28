import 'package:flutter/material.dart';
import 'package:ovo/ui/common/widgets/button/button.dart';

class ChartBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;

  const ChartBadge(
      {super.key, required this.icon, required this.text, this.size = 45.0});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: SizedBox(
        width: 40,
        height: 40,
        child: AspectRatio(
          aspectRatio: 1,
          child: ButtonTheme(
            padding: EdgeInsets.all(0.0),
            shape: CircleBorder(),
            height: 40,
            minWidth: 20,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            child: AdaptiveButton(
              type: ButtonType.elevated,
              minSize: 0,
              onPressed: (){},
              child: Icon(
                icon,
                size: (size - 25),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
