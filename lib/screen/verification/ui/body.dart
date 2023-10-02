import 'package:citizen_app/enums/submission_status.dart';
import 'package:citizen_app/screen/verification/bloc/verification_bloc.dart';
import 'package:citizen_app/screen/verification/ui/pin_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.email});

  final String email;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int remainingTime = 60;

  @override
  void initState() {
    super.initState();
    resendCodeTimer();
  }

  void resendCodeTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        remainingTime--;
      });
      if (remainingTime > 0) {
        resendCodeTimer();
      }
    });
  }

  void showSnackBarMessage(BuildContext context, message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
    return BlocListener<VerificationBloc, VerificationState>(
      listener: (context, state) => {
        if (state.resendCodeStatus is SubmissionSuccess)
          {
            setState(() {
              remainingTime = 60;
            }),
            resendCodeTimer()
          }
        else if (state.submissionStatus is SubmissionFailure)
          {},
        context.read<VerificationBloc>().add(ResendCodeReset())
      },
      child: BlocBuilder<VerificationBloc,VerificationState>(
          bloc: BlocProvider.of<VerificationBloc>(context),
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    AppLocalizations.of(context)!.verifyEmail,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!
                          .verificationEmailMessage1,
                      children: [
                        TextSpan(
                            text: widget.email,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .verificationEmailMessage2)
                      ],
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  PinField(email: widget.email),
                  const SizedBox(height: 20),
                  remainingTime > 0
                      ? Text(
                          '${AppLocalizations.of(context)!.resendCodeIn} $remainingTime',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            context
                                .read<VerificationBloc>()
                                .add(ResendCode(email: widget.email));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.resend,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                ],
              ),
            ));
          }),
    );
  }
}
