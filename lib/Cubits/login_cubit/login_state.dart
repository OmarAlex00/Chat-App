part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  String message;
  LoginSuccess({required this.message});
}

class LoginFail extends LoginState {
  String message;
  LoginFail({required this.message});
}
