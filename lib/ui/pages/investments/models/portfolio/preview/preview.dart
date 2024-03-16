import 'package:ovo/ui/pages/investments/models/portfolio/portfolio_type.dart';

class PremadePortfolioPreview {
  static const conservative = PremadePortfolioPreview(
      portfolio: Portfolio.coservative,
      title: 'Conservative',
      description: '',
      picture: 'assets/turtle.svg');

  static const balanced = PremadePortfolioPreview(
      portfolio: Portfolio.balanced,
      title: 'Balanced',
      description: '',
      picture: 'assets/swan.svg');

  static const aggressive = PremadePortfolioPreview(
      portfolio: Portfolio.aggressive,
      title: 'Aggressive',
      description: '',
      picture: 'assets/crocodile.svg');

  static const max = PremadePortfolioPreview(
      portfolio: Portfolio.max,
      title: 'Max',
      description: '',
      picture: 'assets/bird.svg');

  static const values = [conservative, balanced, aggressive, max];

  final Portfolio portfolio;
  final String title;
  final String description;
  final String picture;

  const PremadePortfolioPreview(
      {required this.portfolio,
      required this.title,
      required this.description,
      required this.picture});
}
