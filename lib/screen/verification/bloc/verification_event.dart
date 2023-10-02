
part of 'verification_bloc.dart';

@immutable
abstract class VerificationEvent {}

class VerificationCodeChanged extends VerificationEvent {
  final String code;

  VerificationCodeChanged({required this.code});
}

class VerificationSubmitted extends VerificationEvent {
  final String email;

  final String code;

  VerificationSubmitted({required this.email,required this.code});
}

class ResendCode extends VerificationEvent {
  final String email;

  ResendCode({required this.email});
}

class ResendCodeReset extends VerificationEvent {}
