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

class RegisterCitizenIdChanged extends RegisterEvent {
  final String citizenId;

  RegisterCitizenIdChanged({required this.citizenId});
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String citizenId;

  RegisterSubmitted(
      {required this.email, required this.password, required this.citizenId});
}
