import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(RegisterState()) {
    on<RegisterEmailChanged>(_emailChangeEvent);
    on<RegisterPasswordChanged>(_passwordChangeEvent);
    on<RegisterConfirmPasswordChanged>(_confirmPasswordChangeEvent);
    on<RegisterNationalIdChanged>(_nationalIdChangeEvent);
    on<RegisterSubmitted>(_registerSubmittedEvent);
    on<RegisterReset>(_registerReset);
  }

  void _emailChangeEvent(
      RegisterEmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChangeEvent(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordChangeEvent(
      RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _nationalIdChangeEvent(
      RegisterNationalIdChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(nationalId: event.nationalId));
  }

  void _registerSubmittedEvent(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(submissionStatus: const SubmissionInProgress()));
    try {
      await authRepository.register(
          event.email, event.password, event.nationalId);

      emit(state.copyWith(submissionStatus: const SubmissionSuccess()));
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400 && e.response!.data['code'] == 1001) {
          emit(state.copyWith(
              submissionStatus: SubmissionFailure(
                  Exception(ErrorMessage.emailAlreadyInUse))));
          return;
        } else if (e.response!.statusCode == 400 &&
            e.response!.data['code'] == 1002) {
          emit(state.copyWith(
              submissionStatus: SubmissionFailure(
                  Exception(ErrorMessage.profileAlreadyExist))));
          return;
        } else if (e.response!.statusCode == 404) {
          emit(state.copyWith(
              submissionStatus:
                  SubmissionFailure(Exception(ErrorMessage.profileNotFound))));
          return;
        }
      } else {
        emit(
          state.copyWith(
            submissionStatus: SubmissionFailure(
              Exception(ErrorMessage.somethingWentWrong),
            ),
          ),
        );
      }
    }
  }

  void _registerReset(RegisterReset event, Emitter<RegisterState> emit) {
    emit(state.copyWith(submissionStatus: const SubmissionInitial()));
  }
}
