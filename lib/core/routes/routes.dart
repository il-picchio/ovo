import 'package:flutter/foundation.dart';

@immutable
sealed class Routes {
  static const String home = '/';
  static const String kyc = '/kyc';
  static const String openPortfolio = '/open-portfolio';
  static const String wealthAnalysis = '/wealth-analysis';
}
