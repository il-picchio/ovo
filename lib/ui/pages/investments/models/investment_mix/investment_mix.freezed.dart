// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_mix.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvestmentMix _$InvestmentMixFromJson(Map<String, dynamic> json) {
  return _InvestmentMix.fromJson(json);
}

/// @nodoc
mixin _$InvestmentMix {
  double get stocks => throw _privateConstructorUsedError;
  double get bonds => throw _privateConstructorUsedError;
  double get crypto => throw _privateConstructorUsedError;
  double get commodities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentMixCopyWith<InvestmentMix> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentMixCopyWith<$Res> {
  factory $InvestmentMixCopyWith(
          InvestmentMix value, $Res Function(InvestmentMix) then) =
      _$InvestmentMixCopyWithImpl<$Res, InvestmentMix>;
  @useResult
  $Res call({double stocks, double bonds, double crypto, double commodities});
}

/// @nodoc
class _$InvestmentMixCopyWithImpl<$Res, $Val extends InvestmentMix>
    implements $InvestmentMixCopyWith<$Res> {
  _$InvestmentMixCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stocks = null,
    Object? bonds = null,
    Object? crypto = null,
    Object? commodities = null,
  }) {
    return _then(_value.copyWith(
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as double,
      bonds: null == bonds
          ? _value.bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as double,
      crypto: null == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as double,
      commodities: null == commodities
          ? _value.commodities
          : commodities // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentMixImplCopyWith<$Res>
    implements $InvestmentMixCopyWith<$Res> {
  factory _$$InvestmentMixImplCopyWith(
          _$InvestmentMixImpl value, $Res Function(_$InvestmentMixImpl) then) =
      __$$InvestmentMixImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double stocks, double bonds, double crypto, double commodities});
}

/// @nodoc
class __$$InvestmentMixImplCopyWithImpl<$Res>
    extends _$InvestmentMixCopyWithImpl<$Res, _$InvestmentMixImpl>
    implements _$$InvestmentMixImplCopyWith<$Res> {
  __$$InvestmentMixImplCopyWithImpl(
      _$InvestmentMixImpl _value, $Res Function(_$InvestmentMixImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stocks = null,
    Object? bonds = null,
    Object? crypto = null,
    Object? commodities = null,
  }) {
    return _then(_$InvestmentMixImpl(
      stocks: null == stocks
          ? _value.stocks
          : stocks // ignore: cast_nullable_to_non_nullable
              as double,
      bonds: null == bonds
          ? _value.bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as double,
      crypto: null == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as double,
      commodities: null == commodities
          ? _value.commodities
          : commodities // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentMixImpl implements _InvestmentMix {
  const _$InvestmentMixImpl(
      {required this.stocks,
      required this.bonds,
      required this.crypto,
      required this.commodities});

  factory _$InvestmentMixImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentMixImplFromJson(json);

  @override
  final double stocks;
  @override
  final double bonds;
  @override
  final double crypto;
  @override
  final double commodities;

  @override
  String toString() {
    return 'InvestmentMix(stocks: $stocks, bonds: $bonds, crypto: $crypto, commodities: $commodities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentMixImpl &&
            (identical(other.stocks, stocks) || other.stocks == stocks) &&
            (identical(other.bonds, bonds) || other.bonds == bonds) &&
            (identical(other.crypto, crypto) || other.crypto == crypto) &&
            (identical(other.commodities, commodities) ||
                other.commodities == commodities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stocks, bonds, crypto, commodities);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentMixImplCopyWith<_$InvestmentMixImpl> get copyWith =>
      __$$InvestmentMixImplCopyWithImpl<_$InvestmentMixImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentMixImplToJson(
      this,
    );
  }
}

abstract class _InvestmentMix implements InvestmentMix {
  const factory _InvestmentMix(
      {required final double stocks,
      required final double bonds,
      required final double crypto,
      required final double commodities}) = _$InvestmentMixImpl;

  factory _InvestmentMix.fromJson(Map<String, dynamic> json) =
      _$InvestmentMixImpl.fromJson;

  @override
  double get stocks;
  @override
  double get bonds;
  @override
  double get crypto;
  @override
  double get commodities;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentMixImplCopyWith<_$InvestmentMixImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
