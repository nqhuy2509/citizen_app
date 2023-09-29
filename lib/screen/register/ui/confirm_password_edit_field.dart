import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmPasswordEditField extends StatefulWidget {
  const ConfirmPasswordEditField(
      {super.key, required this.handleSubmitRegister});

  final Function(BuildContext, RegisterState) handleSubmitRegister;

  @override
  State<ConfirmPasswordEditField> createState() =>
      _ConfirmPasswordEditFieldState();
}

class _ConfirmPasswordEditFieldState extends State<ConfirmPasswordEditField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        bloc: BlocProvider.of<RegisterBloc>(context),
        builder: (context, state) => TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                labelText: AppLocalizations.of(context)!.confirmPassword,
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
                if (!state.isValidConfirmPassword) {
                  return AppLocalizations.of(context)!.invalidConfirmPassword;
                }
                return null;
              },
              onChanged: (confirmPassword) {
                context.read<RegisterBloc>().add(
                      RegisterConfirmPasswordChanged(
                          confirmPassword: confirmPassword),
                    );
              },
            ));
  }
}
