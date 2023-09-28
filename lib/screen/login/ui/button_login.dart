import 'package:citizen_app/screen/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key, required this.handleSubmitLogin});

  final Function(BuildContext, LoginState) handleSubmitLogin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: BlocProvider.of<LoginBloc>(context),
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
