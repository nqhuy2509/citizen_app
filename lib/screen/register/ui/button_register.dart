import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({super.key, required this.handleSubmitRegister});

  final Function(BuildContext, RegisterState) handleSubmitRegister;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: BlocProvider.of<RegisterBloc>(context),
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          handleSubmitRegister(context, state);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          AppLocalizations.of(context)!.register,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
