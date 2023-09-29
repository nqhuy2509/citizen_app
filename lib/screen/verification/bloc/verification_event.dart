
part of 'verification_bloc.dart';

@immutable
abstract class VerificationEvent {}

class VerificationCodeChanged extends VerificationEvent {
  final String code;

  VerificationCodeChanged({required this.code});
}