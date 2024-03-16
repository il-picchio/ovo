import 'package:ovo/ui/pages/investments/models/investment_mix/investment_mix.dart';
import 'package:ovo/ui/pages/investments/models/portfolio/portfolio_type.dart';
import 'package:ovo/ui/pages/investments/models/portfolio/preview/preview.dart';

class PremadePortfolio extends PremadePortfolioPreview {
  final InvestmentMix investmentMix;

  const PremadePortfolio._(
      {required super.portfolio,
      required super.title,
      required super.description,
      required super.picture,
      required this.investmentMix});

  factory PremadePortfolio.fromJson(
      {required Map<String, dynamic> investmentMix,
      required Portfolio portfolio}) {
    final preview = PremadePortfolioPreview.values
        .firstWhere((element) => element.portfolio == portfolio);
    return PremadePortfolio._(
        portfolio: portfolio,
        title: preview.title,
        description: preview.description,
        picture: preview.description,
        investmentMix: InvestmentMix.fromJson(investmentMix));
  }
}
