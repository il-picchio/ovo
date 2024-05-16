import 'package:ovo/ui/pages/investments/wealth_analysis/models/currency_value_map/currency_value_map.dart';
import 'package:ovo/ui/pages/investments/wealth_analysis/models/investment_type.dart';

class Wealth {
  static final initialValue = Wealth(
    investmentType: InvestmentType.regularly,
  );

  factory Wealth.initial() => initialValue;

  InvestmentType investmentType;
  Iterable<CurrencyValueMap>? initialInvestment;
  Iterable<CurrencyValueMap>? regularInvestment;
  Iterable<CurrencyValueMap>? salary;
  Iterable<CurrencyValueMap>? liquidableAmount;

  Wealth({required this.investmentType});
}
