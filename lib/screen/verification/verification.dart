import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/home/home.dart';
import 'package:citizen_app/screen/verification/bloc/verification_bloc.dart';
import 'package:citizen_app/screen/verification/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  static String routeName = '/verification';

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late String email;

  final VerificationBloc _verificationBloc =
      VerificationBloc(authRepository: AuthRepository());


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null && args['email'] != null) {
      email = args['email'];
    }

    return BlocProvider(
      create: (context) => _verificationBloc,
      child: BlocListener<VerificationBloc, VerificationState>(
          listener: (context, state) {
            if (state.submissionStatus is SubmissionSuccess) {
              Navigator.pushNamed(context, Home.routeName);
            }
          },
          child: BlocBuilder<VerificationBloc, VerificationState>(
            builder: (context, state) => Stack(
              children: [
                Scaffold(
                  appBar: AppBar(),
                  body: Body(email: email),
                ),
                if (state.submissionStatus is SubmissionInProgress)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
