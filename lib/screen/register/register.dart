import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/profile/ui/body.dart';
import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  Register({super.key});

  static String routeName = '/register';

  final RegisterBloc _registerBloc =
      RegisterBloc(authRepository: AuthRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.submissionStatus is SubmissionSuccess) {
            Navigator.pushNamed(context, '/verification');
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
