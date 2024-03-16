// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_mix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentMixImpl _$$InvestmentMixImplFromJson(Map<String, dynamic> json) =>
    _$InvestmentMixImpl(
      stocks: (json['stocks'] as num).toDouble(),
      bonds: (json['bonds'] as num).toDouble(),
      crypto: (json['crypto'] as num).toDouble(),
      commodities: (json['commodities'] as num).toDouble(),
    );

Map<String, dynamic> _$$InvestmentMixImplToJson(_$InvestmentMixImpl instance) =>
    <String, dynamic>{
      'stocks': instance.stocks,
      'bonds': instance.bonds,
      'crypto': instance.crypto,
      'commodities': instance.commodities,
    };
