import 'package:citizen_app/enums/error_message.dart';
import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/verification/verification.dart';
import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:citizen_app/screen/register/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterBloc _registerBloc =
      RegisterBloc(authRepository: AuthRepository());

  @override
  void dispose() {
    super.dispose();
    _registerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.submissionStatus is SubmissionSuccess) {
            Navigator.pushNamed(context, Verification.routeName, arguments: {
              'email': state.email,
            });
          } else if (state.submissionStatus is SubmissionFailure) {
            final error = state.submissionStatus as SubmissionFailure;
            final errorString = error.exception.toString();
            String errorMessage;
            if (errorString
                .contains(ErrorMessage.emailAlreadyInUse.toString())) {
              errorMessage = AppLocalizations.of(context)!.emailAlreadyExists;
            } else if (errorString
                .contains(ErrorMessage.profileNotFound.toString())) {
              errorMessage = AppLocalizations.of(context)!.nationalIdNotFound;
            } else if (errorString
                .contains(ErrorMessage.profileAlreadyExist.toString())) {
              errorMessage =
                  AppLocalizations.of(context)!.nationalIdAlreadyExists;
            } else {
              errorMessage = AppLocalizations.of(context)!.somethingWentWrong;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );

            context.read<RegisterBloc>().add(RegisterReset());
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
