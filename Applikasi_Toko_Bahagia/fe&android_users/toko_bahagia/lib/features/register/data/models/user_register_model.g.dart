// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRegister _$$_UserRegisterFromJson(Map<String, dynamic> json) =>
    _$_UserRegister(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      token: json['token'] as String? ?? '',
      password_confirmation: json['password_confirmation'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserRegisterToJson(_$_UserRegister instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'token': instance.token,
      'password_confirmation': instance.password_confirmation,
      'role': instance.role,
    };
