// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentDetailImpl _$$InvestmentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentDetailImpl(
      title: json['title'] as String,
      isin: json['isin'] as String,
      type: $enumDecode(_$InvestmentTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$InvestmentDetailImplToJson(
        _$InvestmentDetailImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isin': instance.isin,
      'type': _$InvestmentTypeEnumMap[instance.type]!,
      'value': instance.value,
      'description': instance.description,
    };

const _$InvestmentTypeEnumMap = {
  InvestmentType.bond: 'bond',
  InvestmentType.stock: 'stock',
  InvestmentType.commodity: 'commodity',
  InvestmentType.crypto: 'crypto',
};
