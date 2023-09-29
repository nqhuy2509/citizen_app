import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordEditField extends StatefulWidget {
  const PasswordEditField({super.key});

  @override
  State<PasswordEditField> createState() => _PasswordEditFieldState();
}

class _PasswordEditFieldState extends State<PasswordEditField> {
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
          context
              .read<RegisterBloc>()
              .add(RegisterPasswordChanged(password: value));
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
