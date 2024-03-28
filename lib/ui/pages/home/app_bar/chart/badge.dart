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
        width: 50,
        height: 50,
        child: AdaptiveButton(
          type: ButtonType.elevated,
          internalPadding: EdgeInsets.all(0.0),
          externalPadding: EdgeInsets.all(0.0),
          onPressed: (){},
          child: Icon(
            icon,
            size: (size - 25),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
