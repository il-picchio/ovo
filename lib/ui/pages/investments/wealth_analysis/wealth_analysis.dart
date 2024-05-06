import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovo/ui/common/background/background.dart';
import 'package:ovo/ui/common/background/decorations.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/bloc/wealth_analysis_bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/investable_amount.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/investment_frequency.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/liquidable_funds.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/salary.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/spending_analysis.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/questions/wealth_analysis_question_container.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/ui/wealth_analysis_description.dart';

class WealthAnalysis extends StatelessWidget {
  static final _questionToWidget = <QuestionId, Widget Function()>{
    QuestionId.investFrequency: () => const InvestmentFrequency(),
    QuestionId.investAmount: () => const WealthAnalysisInitialInvestAmount(),
    QuestionId.liquidableFunds: () => const WealthAnalysisLiquidableFunds(),
    QuestionId.salary: () => const WealthAnalysisSalary(),
    QuestionId.spending: () => const WealthAnalysisSpending()
  };

  const WealthAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Wealth analysis'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(FontAwesomeIcons.xmark),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            WealthAnalysisBloc()..add(WealthAnalysisDescriptionEvent()),
        child: Background(
          decorations: Decorations.investments(context),
          child: BlocBuilder<WealthAnalysisBloc, WealthAnalysisState>(
            builder: (context, state) {
              if (state is WealthAnalysisDescriptionState) {
                return const WealthAnalysisDescription();
              }
              if (state is WealthAnalysisQuestionState) {
                print(state.id);
                final Widget Function() widget = _questionToWidget[state.id] ?? (() => const Placeholder());
                return WealthAnalysisQuestionContainer(id: state.id, child: widget());
              }
              return Text('Not implemented');
            },
          ),
        ),
      ),
    );
  }
}
