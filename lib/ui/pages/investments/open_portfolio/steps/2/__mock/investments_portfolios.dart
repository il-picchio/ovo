import 'package:ovo/ui/pages/investments/open_portfolio/steps/2/investment_card.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/models/investment_mix.dart';

const portfolios = [
  InvestmentCard(
    title: 'Turtle', 
    description: 'Better be safe than sorry', 
    picture: 'turtle', 
    preferred: false,
    investments: InvestmentMix(
      stocks: 40, 
      bonds: 60, 
      crypto: 0,
    ),
  ),
  InvestmentCard(
        title: 'Swan',
        description: 'An elegan way to grow your capitals with conscious risks',
        picture: 'swan',
        preferred: false,
        investments: InvestmentMix(stocks: 60, bonds: 40, crypto: 0),
      ),
      InvestmentCard(
        title: 'Crocodile',
        description:
            'Silently grow your capital exploiting market opportunities',
        picture: 'crocodile',
        preferred: false,
                investments: InvestmentMix(stocks: 80, bonds: 20, crypto: 0),

      ),
      InvestmentCard(
        title: 'Wild bird',
        description: 'The maximum for the maximum',
        investments: InvestmentMix(stocks: 90, bonds: 0, crypto: 10),
        picture: 'bird',
        preferred: true,
      )
];