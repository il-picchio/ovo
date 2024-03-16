import 'package:freezed_annotation/freezed_annotation.dart';
part 'investment_mix.freezed.dart';
part 'investment_mix.g.dart';

@freezed
class InvestmentMix with _$InvestmentMix {
  const factory InvestmentMix({
    required double stocks,
    required double bonds,
    required double crypto,
    required double commodities,
  }) = _InvestmentMix;

  factory InvestmentMix.fromJson(Map<String, dynamic> json) =>
      _$InvestmentMixFromJson(json);
}
