// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetailPulsa _$OrderDetailPulsaFromJson(Map<String, dynamic> json) {
  return _OrderDetailPulsa.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailPulsa {
  Credit get credit => throw _privateConstructorUsedError;
  String get number_phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailPulsaCopyWith<OrderDetailPulsa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailPulsaCopyWith<$Res> {
  factory $OrderDetailPulsaCopyWith(
          OrderDetailPulsa value, $Res Function(OrderDetailPulsa) then) =
      _$OrderDetailPulsaCopyWithImpl<$Res, OrderDetailPulsa>;
  @useResult
  $Res call({Credit credit, String number_phone});

  $CreditCopyWith<$Res> get credit;
}

/// @nodoc
class _$OrderDetailPulsaCopyWithImpl<$Res, $Val extends OrderDetailPulsa>
    implements $OrderDetailPulsaCopyWith<$Res> {
  _$OrderDetailPulsaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = null,
    Object? number_phone = null,
  }) {
    return _then(_value.copyWith(
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as Credit,
      number_phone: null == number_phone
          ? _value.number_phone
          : number_phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditCopyWith<$Res> get credit {
    return $CreditCopyWith<$Res>(_value.credit, (value) {
      return _then(_value.copyWith(credit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailPulsaCopyWith<$Res>
    implements $OrderDetailPulsaCopyWith<$Res> {
  factory _$$_OrderDetailPulsaCopyWith(
          _$_OrderDetailPulsa value, $Res Function(_$_OrderDetailPulsa) then) =
      __$$_OrderDetailPulsaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Credit credit, String number_phone});

  @override
  $CreditCopyWith<$Res> get credit;
}

/// @nodoc
class __$$_OrderDetailPulsaCopyWithImpl<$Res>
    extends _$OrderDetailPulsaCopyWithImpl<$Res, _$_OrderDetailPulsa>
    implements _$$_OrderDetailPulsaCopyWith<$Res> {
  __$$_OrderDetailPulsaCopyWithImpl(
      _$_OrderDetailPulsa _value, $Res Function(_$_OrderDetailPulsa) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = null,
    Object? number_phone = null,
  }) {
    return _then(_$_OrderDetailPulsa(
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as Credit,
      number_phone: null == number_phone
          ? _value.number_phone
          : number_phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetailPulsa implements _OrderDetailPulsa {
  _$_OrderDetailPulsa({required this.credit, required this.number_phone});

  factory _$_OrderDetailPulsa.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailPulsaFromJson(json);

  @override
  final Credit credit;
  @override
  final String number_phone;

  @override
  String toString() {
    return 'OrderDetailPulsa(credit: $credit, number_phone: $number_phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailPulsa &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.number_phone, number_phone) ||
                other.number_phone == number_phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, credit, number_phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDetailPulsaCopyWith<_$_OrderDetailPulsa> get copyWith =>
      __$$_OrderDetailPulsaCopyWithImpl<_$_OrderDetailPulsa>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailPulsaToJson(
      this,
    );
  }
}

abstract class _OrderDetailPulsa implements OrderDetailPulsa {
  factory _OrderDetailPulsa(
      {required final Credit credit,
      required final String number_phone}) = _$_OrderDetailPulsa;

  factory _OrderDetailPulsa.fromJson(Map<String, dynamic> json) =
      _$_OrderDetailPulsa.fromJson;

  @override
  Credit get credit;
  @override
  String get number_phone;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailPulsaCopyWith<_$_OrderDetailPulsa> get copyWith =>
      throw _privateConstructorUsedError;
}
