part of 'register_bloc.dart';

class RegisterState {
  final String email;

  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  final String password;
  bool get isValidPassword => password.length > 6;

  final String confirmPassword;
  bool get isValidConfirmPassword => confirmPassword == password;

  final String citizenId;

  final SubmissionStatus submissionStatus;

  RegisterState({
    this.email = '',
    this.password = '',
    this.citizenId = '',
    this.confirmPassword = '',
    this.submissionStatus = const SubmissionInitial(),
  });

  RegisterState copyWith({
    String? email,
    String? password,
    String? citizenId,
    String? confirmPassword,
    SubmissionStatus? submissionStatus,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      citizenId: citizenId ?? this.citizenId,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }
}
