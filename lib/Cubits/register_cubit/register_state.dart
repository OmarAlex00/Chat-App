part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

// ignore: must_be_immutable
class RegisterSuccess extends RegisterState {
  String message;
  RegisterSuccess({required this.message});
}

// ignore: must_be_immutable
class RegisterFail extends RegisterState {
  String message;
  RegisterFail({required this.message});
}
