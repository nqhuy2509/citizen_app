import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  LoginBloc() : super(LoginState());

  void _mapEmailEventToState(EmailEvent event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }
}