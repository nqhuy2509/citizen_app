part of 'login_bloc.dart';

class LoginState {
  final String email;
  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  final String password;
  bool get isValidPassword => password.length > 6;

  final SubmissionStatus submissionStatus;

  LoginState({required this.email, required this.password, this.submissionStatus = const SubmissionInitial()});

  factory LoginState.initial(){
    return LoginState(
      email: '',
      password: ''
    );
  }

  LoginState copyWith({String? email, String? password, SubmissionStatus? submissionStatus}){
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus ?? this.submissionStatus
    );
  }
}