import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/login/bloc/login_bloc.dart';
import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/screen/login/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatelessWidget {
  Login({super.key});

  static String routeName = '/login';

  final LoginBloc _loginBloc = LoginBloc(authRepository: AuthRepository());

  void _showSnackBarMessage(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.submissionStatus is SubmissionSuccess) {
            Navigator.pushNamed(context, '/home');
          } else if (state.submissionStatus is SubmissionFailure) {
            final error = state.submissionStatus as SubmissionFailure;
            final errorString = error.exception.toString();
            String errorMessage;
            if (errorString.contains(ErrorMessage.invalidCredential.toString())) {
              errorMessage = AppLocalizations.of(context)!.invalidCredentials;
            } else {
              errorMessage = AppLocalizations.of(context)!.somethingWentWrong;
            }

            _showSnackBarMessage(context, errorMessage);
            context.read<LoginBloc>().add(LoginReset());
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => Stack(
            children: [
              const Scaffold(
                body: Body(),
              ),
              if (state.submissionStatus is SubmissionInProgress)
                Container(
                  color: Colors.black12,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
