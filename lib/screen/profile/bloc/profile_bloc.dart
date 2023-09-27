
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  final AuthRepository authRepository;

  ProfileBloc({required this.authRepository}) : super(ProfileState.initial()){
    on<LogoutUser>(_logoutUserEvent);
  }

  void _logoutUserEvent(LogoutUser event, Emitter<ProfileState> emit) async {
    await SecureStorageUtils.instance.deleteToken();
    emit(ProfileState.initial());
  }


}