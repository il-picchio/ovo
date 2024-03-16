import 'package:ovo/ui/pages/investments/models/investment_detail/investment_detail.dart';
import 'package:ovo/ui/pages/investments/models/portfolio/preview/preview.dart';

class PortfolioDetails {
  final PremadePortfolioPreview basePortfolio;
  final List<InvestmentDetail> investments;

  const PortfolioDetails(
      {required this.basePortfolio, required this.investments});

  factory PortfolioDetails.fromJson(
          {required PremadePortfolioPreview basePortfolio,
          required List<Map<String, dynamic>> json}) =>
      PortfolioDetails(
          basePortfolio: basePortfolio,
          investments: json.map((e) => InvestmentDetail.fromJson(e)).toList());

  @override
  String toString() {
    return 'PortfolioDetails(basePotfolio:${basePortfolio.portfolio}, basePortfolioTitle:${basePortfolio.title}, investments: ${investments.toString()})';
  }
}
