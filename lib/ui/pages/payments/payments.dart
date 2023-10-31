import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(decorations: Decorations.payments(context), children: []);
  }
}