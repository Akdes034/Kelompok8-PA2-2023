import 'package:delshop/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator.dart';
import '../../../login/data/models/user_model.dart' as userLogin;
import '../../data/models/user_model.dart' as userRegister;
import '../../domain/usecases/register_usecase.dart';
import './register_event.dart';
import './register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitialState()) {
    // normal register
    on<RegisterUserEvent>(
      (event, emit) async {
        final user = event.user;
        emit(const RegisterState.loading());
        var result =
            await serviceLocator<RegisterUserUsecase>().registerUser(user);
        await result.fold(
          (failure) async {
              emit(RegisterState.error(failure.message));
          },
          (data) async {
            var userLo = userLogin.User(
                email: user.email,
                password: user.password
            );
            var result =
            await serviceLocator<LoginUserUsecase>().loginUser(userLo);
            await result.fold(
                  (failure) async {
                emit(RegisterState.error(failure.message));
              },
                  (data) async {
                var userRe = userRegister.User(
                  id: user.id,
                  name: user.name,
                  email: user.email,
                  password: user.password,
                  phone: user.phone,
                  avatar: user.avatar,
                  token: user.token,
                );
                emit(RegisterState.loaded(user: userRe));
              },
            );
          },
        );
      },
    );
    // google register
    on<RegisterUserGoogleEvent>(
      (event, emit) async {
        emit(const RegisterState.loading());
        var result = await serviceLocator<RegisterUserUsecase>()
            .registerUserWithGoogle();
        result.fold(
          (failure) {
            emit(RegisterState.error(failure.message));
          },
          (data) {
            emit(RegisterState.loaded(user: data));
          },
        );
      },
    );
    // facebook register
    on<RegisterUserFacebookEvent>(
      (event, emit) async {
        emit(const RegisterState.loading());
        var result = await serviceLocator<RegisterUserUsecase>()
            .registerUserWithFacebook();
        result.fold(
          (failure) {
            emit(RegisterState.error(failure.message));
          },
          (data) {
            emit(RegisterState.loaded(user: data));
          },
        );
      },
    );
  }
}
