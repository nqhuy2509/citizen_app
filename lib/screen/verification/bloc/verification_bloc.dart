import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState>{

  final AuthRepository authRepository;


  VerificationBloc({required this.authRepository}) : super(VerificationState()){
    on<VerificationCodeChanged>(_codeChangeEvent);
    on<ResendCode>(_resendCodeEvent);
    on<ResendCodeReset>(_resendCodeResetEvent);
    on<VerificationSubmitted>(_verificationSubmittedEvent);
  }

  void _codeChangeEvent(VerificationCodeChanged event, Emitter<VerificationState> emit){
    emit(state.copyWith(code: event.code));
  }

  void _resendCodeEvent(ResendCode event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(submissionStatus: const SubmissionInProgress()));
    try {
      final resendCodeRes = await authRepository.resendVerificationCode(event.email);

      if (resendCodeRes.statusCode == 200) {
        emit(state.copyWith(resendCodeStatus: const SubmissionSuccess()));
      } else {
        emit(state.copyWith(
            resendCodeStatus: SubmissionFailure(Exception('Resend code failed'))));
      }
    } catch (e) {
      emit(state.copyWith(
          resendCodeStatus:
              SubmissionFailure(Exception(ErrorMessage.somethingWentWrong))));
    }
  }

  void _resendCodeResetEvent(ResendCodeReset event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(resendCodeStatus: const SubmissionInitial()));
  }

  void _verificationSubmittedEvent(
      VerificationSubmitted event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(submissionStatus: const SubmissionInProgress()));
    try{
      final verificationRes = await authRepository.verifyCode(event.email, event.code);

      if(verificationRes.statusCode == 200){
        emit(state.copyWith(submissionStatus: const SubmissionSuccess()));
      }else{
        emit(state.copyWith(
            submissionStatus: SubmissionFailure(Exception('Verification failed'))));
      }
    }catch(e){
      if(e is DioException){

      }
    }
  }
}