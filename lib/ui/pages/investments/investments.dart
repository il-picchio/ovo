import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/empty/empty_page.dart';
import 'package:ovo/ui/pages/investments/portfolio/portfolio_page.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      decorations: Decorations.investments(context),
      child: EmptyPage(),
    );
  }
}
