part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({required this.email});
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({required this.password});
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  RegisterConfirmPasswordChanged({required this.confirmPassword});
}

class RegisterNationalIdChanged extends RegisterEvent {
  final String nationalId;

  RegisterNationalIdChanged({required this.nationalId});
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String nationalId;

  RegisterSubmitted(
      {required this.email, required this.password, required this.nationalId});
}

class RegisterReset extends RegisterEvent {}