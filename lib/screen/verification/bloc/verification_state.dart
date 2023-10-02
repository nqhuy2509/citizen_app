
part of 'verification_bloc.dart';

class VerificationState{
  final String code;
  bool get isValidCode => code.length == 6 && int.tryParse(code) != null;

  final String email;

  final SubmissionStatus submissionStatus;

  final SubmissionStatus resendCodeStatus;

  VerificationState({this.code = '',this.email = '', this.submissionStatus = const SubmissionInitial(), this.resendCodeStatus = const SubmissionInitial()});

  VerificationState copyWith({String? code, String? email, SubmissionStatus? submissionStatus, SubmissionStatus? resendCodeStatus}){
    return VerificationState(
      code: code ?? this.code,
      email: email ?? this.email,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      resendCodeStatus: resendCodeStatus ?? this.resendCodeStatus
    );
  }
}