import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ovo/ui/pages/investments/models/investment_type.dart';

part 'investment_detail.freezed.dart';
part 'investment_detail.g.dart';

@freezed
class InvestmentDetail with _$InvestmentDetail {
  const factory InvestmentDetail(
      {required String title,
      required String isin,
      required InvestmentType type,
      required double value,
      required String description}) = _InvestmentDetail;

  factory InvestmentDetail.fromJson(Map<String, dynamic> json) =>
      _$InvestmentDetailFromJson(json);
}
