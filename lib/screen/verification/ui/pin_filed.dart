import 'package:citizen_app/generated/l10n.dart';
import 'package:citizen_app/screen/verification/bloc/verification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class PinField extends StatefulWidget {
  const PinField({super.key, required this.email});

  final String? email;

  @override
  State<PinField> createState() => _PinFieldState();
}

class _PinFieldState extends State<PinField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
      builder: (context, state) => PinCodeTextField(
        appContext: context,
        length: 6,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 50,
        ),
        onChanged: (value) {
          context.read<VerificationBloc>().add(VerificationCodeChanged(code: value));
        },
        animationType: AnimationType.none,
        onCompleted: (value) {
          if(state.isValidCode){
            context.read<VerificationBloc>().add(VerificationSubmitted(email: widget.email!, code: value));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context).invalidCode),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        onSubmitted: (value) {
          if(state.isValidCode){
            context.read<VerificationBloc>().add(VerificationSubmitted(email: widget.email!, code: value));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context).invalidCode),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
      ),
    );
  }
}
