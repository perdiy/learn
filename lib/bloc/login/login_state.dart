part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loaded(LoginResponseModel model) = _Loaded;
  const factory LoginState.erorr(String message) = _Error;
}
