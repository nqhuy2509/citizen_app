
part of 'verification_bloc.dart';

class VerificationState{
  final String code;
  bool get isValidCode => code.length == 6;

  final SubmissionStatus submissionStatus;

  VerificationState({this.code = '', this.submissionStatus = const SubmissionInitial()});

  VerificationState copyWith({String? code, SubmissionStatus? submissionStatus}){
    return VerificationState(
      code: code ?? this.code,
      submissionStatus: submissionStatus ?? this.submissionStatus
    );
  }
}