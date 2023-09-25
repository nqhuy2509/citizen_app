import 'package:bloc/bloc.dart';
import 'package:citizen_app/screen/login/submission_status.dart';
import 'package:citizen_app/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:citizen_app/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState.initial()){
    on<LoginEmailChanged>(_emailChangeEvent);
    on<LoginPasswordChanged>(_passwordChangeEvent);
    on<LoginSubmitted>(_loginSubmittedEvent);

  }

  void _emailChangeEvent(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChangeEvent(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmittedEvent(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(submissionStatus: const SubmissionInProgress()));
    try {
      final loginRes =  await authRepository.login(event.email, event.password);

      if(loginRes.statusCode == 200){
        await SecureStorageUtils.instance.saveToken(loginRes.data.accessToken);
        emit(state.copyWith(submissionStatus: const SubmissionSuccess()));
      }else{
        emit(state.copyWith(submissionStatus: SubmissionFailure(Exception('Login failed'))));
      }
    } catch (e) {
      emit(state.copyWith(submissionStatus: SubmissionFailure(e as Exception)));
    }
  }

  void _loginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginState.initial());
  }
}