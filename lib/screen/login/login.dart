import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/register/register.dart';
import 'package:citizen_app/screen/login/bloc/login_bloc.dart';
import 'package:citizen_app/screen/login/submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  final _loginFormKey = GlobalKey<FormState>();

  final LoginBloc _loginBloc = LoginBloc(authRepository: AuthRepository());

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isProcessLogin = false;

  @override
  void dispose() {
    _loginFormKey.currentState?.dispose();
    _loginBloc.close();

    super.dispose();
  }

  void _showSnackBarMessage(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void handleSubmitLogin(BuildContext context, LoginState state) {
    FocusScope.of(context).unfocus();
    if (_loginFormKey.currentState!.validate()) {
      setState(() {
        _isProcessLogin = true;
      });
      context
          .read<LoginBloc>()
          .add(LoginSubmitted(email: state.email, password: state.password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (_isProcessLogin) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
              if (state.submissionStatus is SubmissionSuccess) {
                Navigator.pushNamed(context, '/home');
              } else if (state.submissionStatus is SubmissionFailure) {
                final error = state.submissionStatus as SubmissionFailure;
                final errorString = error.exception.toString();
                String errorMessage;
                if (errorString == ErrorMessage.invalidCredential.toString()) {
                  errorMessage =
                      AppLocalizations.of(context)!.invalidCredentials;
                } else {
                  errorMessage =
                      AppLocalizations.of(context)!.somethingWentWrong;
                }

                _showSnackBarMessage(context, errorMessage);
                setState(() {
                  _isProcessLogin = false;
                });
              }
            },
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: _loginForm(),
              ),
              if (_isProcessLogin)
                Container(
                  color: Colors.black12,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            AppLocalizations.of(context)!.login,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 20),
          _emailEditField(),
          const SizedBox(height: 20),
          _passwordEditField(),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: _loginButton(),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.forgotPassword,
                    style: const TextStyle(fontSize: 16),
                  )),
              const SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.register,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _emailEditField() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) => TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          labelText: AppLocalizations.of(context)!.email,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return AppLocalizations.of(context)!.emailRequired;
          }
          if (!state.isValidEmail) {
            return AppLocalizations.of(context)!.invalidEmail;
          }
          return null;
        },
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginEmailChanged(email: value));
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }

  Widget _passwordEditField() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) => TextFormField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
          ),
          labelText: AppLocalizations.of(context)!.password,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        validator: (value) {
          if (!state.isValidPassword) {
            return AppLocalizations.of(context)!.invalidPassword;
          }
          return null;
        },
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginPasswordChanged(password: value));
        },
        onFieldSubmitted: (_) {
          handleSubmitLogin(context, state);
          _passwordFocusNode.unfocus();
        },
      ),
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          handleSubmitLogin(context, state);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          AppLocalizations.of(context)!.login,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
