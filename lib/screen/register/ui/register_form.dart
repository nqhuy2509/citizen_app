import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final _registerFormKey = GlobalKey<FormState>();

  void handleSubmitRegister(BuildContext context, RegisterState state) {
    FocusScope.of(context).unfocus();

    if (_registerFormKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(
            RegisterSubmitted(
                email: state.email,
                password: state.password,
                citizenId: state.citizenId),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) => Form(
        key: _registerFormKey,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
