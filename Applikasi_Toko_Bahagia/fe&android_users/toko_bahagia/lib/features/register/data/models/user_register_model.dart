import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_register_model.freezed.dart';
part 'user_register_model.g.dart';

@freezed
class UserRegister with _$UserRegister {
  factory UserRegister({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String phone,
    @Default('') String avatar,
    @Default('') String token,
    @Default('') String password_confirmation,
    @Default('') String role,
  }) = _UserRegister;
  factory UserRegister.fromJson(Map<String, Object?> json) => _$UserRegisterFromJson(json);
}
