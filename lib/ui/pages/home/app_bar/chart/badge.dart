import 'package:flutter/material.dart';

class ChartBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;

  const ChartBadge(
      {super.key, required this.icon, required this.text, this.size = 45.0});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      textAlign: TextAlign.center,
      textStyle: const TextStyle(color: Colors.black),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 30,
          ),
        ],
        border: Border.all(color: Colors.white),
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(200),
      ),
      message: text,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Icon(
          icon,
          size: (size - 25),
          color: Colors.white,
        ),
      ),
    );
  }
}
