import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_value_map.freezed.dart';
part 'currency_value_map.g.dart';

@unfreezed
class CurrencyValueMap with _$CurrencyValueMap {
  factory CurrencyValueMap({
    required String currency,
    required String? value
  }) = _CurrencyValueMap;

  factory CurrencyValueMap.fromJson(Map<String, dynamic> json) =>
      _$CurrencyValueMapFromJson(json);
}