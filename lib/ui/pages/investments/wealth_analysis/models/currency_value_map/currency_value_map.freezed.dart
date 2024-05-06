// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_value_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyValueMap _$CurrencyValueMapFromJson(Map<String, dynamic> json) {
  return _CurrencyValueMap.fromJson(json);
}

/// @nodoc
mixin _$CurrencyValueMap {
  String get currency => throw _privateConstructorUsedError;
  set currency(String value) => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  set value(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyValueMapCopyWith<CurrencyValueMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyValueMapCopyWith<$Res> {
  factory $CurrencyValueMapCopyWith(
          CurrencyValueMap value, $Res Function(CurrencyValueMap) then) =
      _$CurrencyValueMapCopyWithImpl<$Res, CurrencyValueMap>;
  @useResult
  $Res call({String currency, String? value});
}

/// @nodoc
class _$CurrencyValueMapCopyWithImpl<$Res, $Val extends CurrencyValueMap>
    implements $CurrencyValueMapCopyWith<$Res> {
  _$CurrencyValueMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyValueMapImplCopyWith<$Res>
    implements $CurrencyValueMapCopyWith<$Res> {
  factory _$$CurrencyValueMapImplCopyWith(_$CurrencyValueMapImpl value,
          $Res Function(_$CurrencyValueMapImpl) then) =
      __$$CurrencyValueMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currency, String? value});
}

/// @nodoc
class __$$CurrencyValueMapImplCopyWithImpl<$Res>
    extends _$CurrencyValueMapCopyWithImpl<$Res, _$CurrencyValueMapImpl>
    implements _$$CurrencyValueMapImplCopyWith<$Res> {
  __$$CurrencyValueMapImplCopyWithImpl(_$CurrencyValueMapImpl _value,
      $Res Function(_$CurrencyValueMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = freezed,
  }) {
    return _then(_$CurrencyValueMapImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyValueMapImpl implements _CurrencyValueMap {
  _$CurrencyValueMapImpl({required this.currency, required this.value});

  factory _$CurrencyValueMapImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyValueMapImplFromJson(json);

  @override
  String currency;
  @override
  String? value;

  @override
  String toString() {
    return 'CurrencyValueMap(currency: $currency, value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyValueMapImplCopyWith<_$CurrencyValueMapImpl> get copyWith =>
      __$$CurrencyValueMapImplCopyWithImpl<_$CurrencyValueMapImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyValueMapImplToJson(
      this,
    );
  }
}

abstract class _CurrencyValueMap implements CurrencyValueMap {
  factory _CurrencyValueMap(
      {required String currency,
      required String? value}) = _$CurrencyValueMapImpl;

  factory _CurrencyValueMap.fromJson(Map<String, dynamic> json) =
      _$CurrencyValueMapImpl.fromJson;

  @override
  String get currency;
  set currency(String value);
  @override
  String? get value;
  set value(String? value);
  @override
  @JsonKey(ignore: true)
  _$$CurrencyValueMapImplCopyWith<_$CurrencyValueMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
