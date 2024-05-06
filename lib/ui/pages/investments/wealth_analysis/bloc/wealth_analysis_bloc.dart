import 'package:bloc/bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/currency_value_map/currency_value_map.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/investment_type.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/wealth.dart';

part 'wealth_analysis_event.dart';
part 'wealth_analysis_state.dart';

class WealthAnalysisBloc
    extends Bloc<WealthAnalysisEvent, WealthAnalysisState> {
  final userWealth = Wealth();
  final List<QuestionId> _userSteps = [];

  WealthAnalysisBloc() : super(WealthAnalysisDescriptionState()) {
    on<WealthAnalysisEvent>((event, emit) {
      if (event is WealthAnalysisDescriptionReadEvent) {
        return _onInvestmentDescriptionRead(emit, event);
      }
      if (event is WealthAnalysisInvestmentFrequencyEvent) {
        return _investmentFrequency(emit, event);
      }
      /*
      if (event is WealthAnalysisInitialInvestEvent) {
        return _setInitialInvestment(emit, event);
      }

      if (event is WealthAnalysisLiquidableFundsEvent) {
        return _liquidableFunds(emit, event);
      }
      if (event is WealthAnalysisDeclaredSalaryEvent) {
        return _userDeclaredSalary(emit, event);
      }
      if (event is WealthAnalysisPreviousStepEvent) {
        return _back(emit);
      }
      */
      // TODO: implement event handler
    });
  }

  void _onInvestmentDescriptionRead(Emitter<WealthAnalysisState> emit,
      WealthAnalysisDescriptionReadEvent event) {
    _userSteps.add(QuestionId.investFrequency);
    emit(const WealthAnalysisQuestionState(id: QuestionId.investFrequency));
  }

  void _investmentFrequency(Emitter<WealthAnalysisState> emit,
      WealthAnalysisInvestmentFrequencyEvent event) {
    switch (event.type) {
      case InvestmentType.once:
      case InvestmentType.both:
        _userSteps.add(QuestionId.investAmount);
        emit(const WealthAnalysisQuestionState(id: QuestionId.investAmount));
      case InvestmentType.regularly:
        _userSteps.add(QuestionId.regularInvestAmount);
        emit(const WealthAnalysisQuestionState(
            id: QuestionId.regularInvestAmount));
    }
  }

  /*

  void _setInitialInvestment(Emitter<WealthAnalysisState> emit,
      WealthAnalysisInitialInvestEvent event) {
    userWealth.initialInvestment = event.declaredWealth;
    _proceed(emit, currentStep: 0);
  }

  void _liquidableFunds(Emitter<WealthAnalysisState> emit,
      WealthAnalysisLiquidableFundsEvent event) {
    userWealth.liquidableAmount = event.liquidableFunds;
    _proceed(emit, currentStep: 1);
  }

  void _userDeclaredSalary(Emitter<WealthAnalysisState> emit,
      WealthAnalysisDeclaredSalaryEvent event) {
    userWealth.salary = event.declaredSalary;
    _proceed(emit, currentStep: 2);
  }
  */

  void _back(Emitter<WealthAnalysisState> emit) {
    final previousStep = _userSteps.removeLast();
    emit(WealthAnalysisQuestionState(id: previousStep));
  }
}
