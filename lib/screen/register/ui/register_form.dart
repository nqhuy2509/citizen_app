import 'package:citizen_app/screen/register/ui/button_register.dart';
import 'package:citizen_app/screen/register/ui/confirm_password_edit_field.dart';
import 'package:citizen_app/screen/register/ui/email_edit_field.dart';
import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:citizen_app/screen/register/ui/national_id_edit_field.dart';
import 'package:citizen_app/screen/register/ui/password_edit_field.dart';
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
                nationalId: state.nationalId),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) => Form(
        key: _registerFormKey,
        child: Column(
          children: [
            const EmailEditField(),
            const SizedBox(height: 20),
            const NationalIdEditField(),
            const SizedBox(height: 20),
            const PasswordEditField(),
            const SizedBox(height: 20),
            ConfirmPasswordEditField(
                handleSubmitRegister: handleSubmitRegister),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ButtonRegister(handleSubmitRegister: handleSubmitRegister),
            ),
          ],
        ),
      ),
    );
  }
}
