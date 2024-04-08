import 'package:bloc/bloc.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/wealth.dart';

part 'wealth_analysis_event.dart';
part 'wealth_analysis_state.dart';

class WealthAnalysisBloc
    extends Bloc<WealthAnalysisEvent, WealthAnalysisState> {
  final userWealth = Wealth();

  WealthAnalysisBloc() : super(WealthAnalysisDescriptionState()) {
    on<WealthAnalysisEvent>((event, emit) {
      if (event is WealthAnalysisDeclaredWealthEvent) {
        // step 0
        return _userDeclaredWealth(emit, event);
      }
      if (event is WealthAnalysisLiquidableFundsEvent) {
        // step 1
        return _liquidableFunds(emit, event);
      }
      if (event is WealthAnalysisDeclaredSalaryEvent) {
        // step 2
        return _userDeclaredSalary(emit, event);
      }
      if (event is WealthAnalysisNextStepEvent) {
        return _proceed(emit, currentStep: event.currentStep);
      }
      if (event is WealthAnalysisPreviousStepEvent) {
        return _back(emit, currentStep: event.currentStep);
      }
      // TODO: implement event handler
    });
  }

  void _userDeclaredWealth(Emitter<WealthAnalysisState> emit,
      WealthAnalysisDeclaredWealthEvent event) {
    userWealth.declaredWealth = event.declaredWealth;
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

  void _proceed(Emitter<WealthAnalysisState> emit, {required int currentStep}) {
    emit(WealthAnalysisQuestionState(step: currentStep + 1));
  }

  void _back(Emitter<WealthAnalysisState> emit, {required int currentStep}) {
    emit(WealthAnalysisQuestionState(step: currentStep - 1));
  }
}
