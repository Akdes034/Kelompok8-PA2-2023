// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return _UserRegister.fromJson(json);
}

/// @nodoc
mixin _$UserRegister {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get password_confirmation => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterCopyWith<UserRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterCopyWith<$Res> {
  factory $UserRegisterCopyWith(
          UserRegister value, $Res Function(UserRegister) then) =
      _$UserRegisterCopyWithImpl<$Res, UserRegister>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String password,
      String phone,
      String avatar,
      String token,
      String password_confirmation,
      String role});
}

/// @nodoc
class _$UserRegisterCopyWithImpl<$Res, $Val extends UserRegister>
    implements $UserRegisterCopyWith<$Res> {
  _$UserRegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? avatar = null,
    Object? token = null,
    Object? password_confirmation = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password_confirmation: null == password_confirmation
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegisterCopyWith<$Res>
    implements $UserRegisterCopyWith<$Res> {
  factory _$$_UserRegisterCopyWith(
          _$_UserRegister value, $Res Function(_$_UserRegister) then) =
      __$$_UserRegisterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String password,
      String phone,
      String avatar,
      String token,
      String password_confirmation,
      String role});
}

/// @nodoc
class __$$_UserRegisterCopyWithImpl<$Res>
    extends _$UserRegisterCopyWithImpl<$Res, _$_UserRegister>
    implements _$$_UserRegisterCopyWith<$Res> {
  __$$_UserRegisterCopyWithImpl(
      _$_UserRegister _value, $Res Function(_$_UserRegister) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? avatar = null,
    Object? token = null,
    Object? password_confirmation = null,
    Object? role = null,
  }) {
    return _then(_$_UserRegister(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password_confirmation: null == password_confirmation
          ? _value.password_confirmation
          : password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRegister implements _UserRegister {
  _$_UserRegister(
      {this.id = 0,
      this.name = '',
      this.email = '',
      this.password = '',
      this.phone = '',
      this.avatar = '',
      this.token = '',
      this.password_confirmation = '',
      this.role = ''});

  factory _$_UserRegister.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegisterFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final String password_confirmation;
  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'UserRegister(id: $id, name: $name, email: $email, password: $password, phone: $phone, avatar: $avatar, token: $token, password_confirmation: $password_confirmation, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegister &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.password_confirmation, password_confirmation) ||
                other.password_confirmation == password_confirmation) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,  name, email, password,
      phone, avatar, token, password_confirmation, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegisterCopyWith<_$_UserRegister> get copyWith =>
      __$$_UserRegisterCopyWithImpl<_$_UserRegister>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegisterToJson(
      this,
    );
  }
}

abstract class _UserRegister implements UserRegister {
  factory _UserRegister(
      {final int id,
      final String name,
      final String email,
      final String password,
      final String phone,
      final String avatar,
      final String token,
      final String password_confirmation,
      final String role}) = _$_UserRegister;

  factory _UserRegister.fromJson(Map<String, dynamic> json) =
      _$_UserRegister.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phone;
  @override
  String get avatar;
  @override
  String get token;
  @override
  String get password_confirmation;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegisterCopyWith<_$_UserRegister> get copyWith =>
      throw _privateConstructorUsedError;
}
