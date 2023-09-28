import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/utils/secure_storage.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginEmailChanged>(_emailChangeEvent);
    on<LoginPasswordChanged>(_passwordChangeEvent);
    on<LoginSubmitted>(_loginSubmittedEvent);
    on<LoginReset>(_loginReset);
  }

  void _emailChangeEvent(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChangeEvent(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmittedEvent(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(submissionStatus: const SubmissionInProgress()));
    try {
      final loginRes = await authRepository.login(event.email, event.password);

      if (loginRes.statusCode == 200) {
        await SecureStorageUtils.instance.saveToken(loginRes.data.accessToken);
        emit(state.copyWith(submissionStatus: const SubmissionSuccess()));
      } else {
        emit(state.copyWith(
            submissionStatus: SubmissionFailure(Exception('Login failed'))));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          emit(state.copyWith(
              submissionStatus: SubmissionFailure(
                  Exception(ErrorMessage.invalidCredential))));
        } else {
          emit(state.copyWith(
              submissionStatus: SubmissionFailure(
                  Exception(ErrorMessage.somethingWentWrong))));
        }
      } else {
        emit(state.copyWith(
            submissionStatus:
                SubmissionFailure(Exception(ErrorMessage.invalidCredential))));
      }
    }
  }

  void _loginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(state.copyWith(submissionStatus: const SubmissionInitial()));
  }
}
