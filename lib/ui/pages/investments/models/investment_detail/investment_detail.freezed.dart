// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvestmentDetail _$InvestmentDetailFromJson(Map<String, dynamic> json) {
  return _InvestmentDetail.fromJson(json);
}

/// @nodoc
mixin _$InvestmentDetail {
  String get title => throw _privateConstructorUsedError;
  String get isin => throw _privateConstructorUsedError;
  InvestmentType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentDetailCopyWith<InvestmentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentDetailCopyWith<$Res> {
  factory $InvestmentDetailCopyWith(
          InvestmentDetail value, $Res Function(InvestmentDetail) then) =
      _$InvestmentDetailCopyWithImpl<$Res, InvestmentDetail>;
  @useResult
  $Res call(
      {String title,
      String isin,
      InvestmentType type,
      double value,
      String description});
}

/// @nodoc
class _$InvestmentDetailCopyWithImpl<$Res, $Val extends InvestmentDetail>
    implements $InvestmentDetailCopyWith<$Res> {
  _$InvestmentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isin = null,
    Object? type = null,
    Object? value = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentDetailImplCopyWith<$Res>
    implements $InvestmentDetailCopyWith<$Res> {
  factory _$$InvestmentDetailImplCopyWith(_$InvestmentDetailImpl value,
          $Res Function(_$InvestmentDetailImpl) then) =
      __$$InvestmentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String isin,
      InvestmentType type,
      double value,
      String description});
}

/// @nodoc
class __$$InvestmentDetailImplCopyWithImpl<$Res>
    extends _$InvestmentDetailCopyWithImpl<$Res, _$InvestmentDetailImpl>
    implements _$$InvestmentDetailImplCopyWith<$Res> {
  __$$InvestmentDetailImplCopyWithImpl(_$InvestmentDetailImpl _value,
      $Res Function(_$InvestmentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isin = null,
    Object? type = null,
    Object? value = null,
    Object? description = null,
  }) {
    return _then(_$InvestmentDetailImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentDetailImpl implements _InvestmentDetail {
  const _$InvestmentDetailImpl(
      {required this.title,
      required this.isin,
      required this.type,
      required this.value,
      required this.description});

  factory _$InvestmentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentDetailImplFromJson(json);

  @override
  final String title;
  @override
  final String isin;
  @override
  final InvestmentType type;
  @override
  final double value;
  @override
  final String description;

  @override
  String toString() {
    return 'InvestmentDetail(title: $title, isin: $isin, type: $type, value: $value, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isin, isin) || other.isin == isin) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, isin, type, value, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentDetailImplCopyWith<_$InvestmentDetailImpl> get copyWith =>
      __$$InvestmentDetailImplCopyWithImpl<_$InvestmentDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentDetailImplToJson(
      this,
    );
  }
}

abstract class _InvestmentDetail implements InvestmentDetail {
  const factory _InvestmentDetail(
      {required final String title,
      required final String isin,
      required final InvestmentType type,
      required final double value,
      required final String description}) = _$InvestmentDetailImpl;

  factory _InvestmentDetail.fromJson(Map<String, dynamic> json) =
      _$InvestmentDetailImpl.fromJson;

  @override
  String get title;
  @override
  String get isin;
  @override
  InvestmentType get type;
  @override
  double get value;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentDetailImplCopyWith<_$InvestmentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
