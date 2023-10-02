import 'package:citizen_app/screen/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailEditField extends StatelessWidget {
  const EmailEditField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: BlocProvider.of<LoginBloc>(context),
      builder: (context, state) => TextFormField(
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
}
