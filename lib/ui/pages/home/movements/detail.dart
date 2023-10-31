import 'package:flutter/material.dart';

class MovementDetail extends StatelessWidget {
  final String label;
  final String data;

  const MovementDetail({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Text(label, style: theme.labelMedium,),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Text(data, style: theme.bodyMedium,),
          )
        ],
      ),
    );
  }
}