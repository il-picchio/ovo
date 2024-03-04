import 'package:flutter/widgets.dart';
import 'package:ovo/core/routes/routes.dart';
import 'package:ovo/ui/home.dart';
import 'package:ovo/ui/pages/investments/kyc/know_your_customer.dart';
import 'package:ovo/ui/pages/investments/open_portfolio/open_portfolio.dart';

final routesMap = Map.of({
  Routes.home: (BuildContext context) => const MainPage(),
  Routes.kyc: (BuildContext context) => const KnowYourCustomer(),
  Routes.openPortfolio: (BuildContext context) => const OpenPortfolioPage()
});
