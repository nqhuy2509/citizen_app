import 'package:citizen_app/screen/login/bloc/login_bloc.dart';
import 'package:citizen_app/screen/login/ui/button_login.dart';
import 'package:citizen_app/screen/login/ui/email_edit_field.dart';
import 'package:citizen_app/screen/login/ui/password_edit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  void handleSubmitLogin(BuildContext context, LoginState state) {
    FocusScope.of(context).unfocus();
    if (_loginFormKey.currentState!.validate()) {
      context
          .read<LoginBloc>()
          .add(LoginSubmitted(email: state.email, password: state.password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state)=>
        Form(
          key: _loginFormKey,
          child: Column(
            children: [
              const EmailEditField(),
              const SizedBox(height: 20),
              PasswordEditField(handleSubmitLogin: handleSubmitLogin,),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ButtonLogin(handleSubmitLogin: handleSubmitLogin),
              ),
            ],
          ),
        )
    );
  }
}
