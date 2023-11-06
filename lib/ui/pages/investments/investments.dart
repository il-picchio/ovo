import 'package:flutter/material.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/chart/chart.dart';
import 'package:ovo/ui/pages/investments/time_horizons/time_horizons.dart';
import 'package:ovo/ui/pages/investments/time_horizons/time_horizons_chips.dart';

class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decorations: Decorations.investments(context),
      child: Column(
        children: [
          Text(
            'Investments',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 30,
          ),
          InvestmentsChart(),
          TimeHorizonChips(initialState: TimeHorizon.sixMonths, onSelectionChanged: (timeHorizon){}),
        ],
      ),
    );
  }
}
