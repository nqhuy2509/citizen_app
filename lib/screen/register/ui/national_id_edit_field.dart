import 'package:citizen_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NationalIdEditField extends StatelessWidget {
  const NationalIdEditField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: BlocProvider.of<RegisterBloc>(context),
      builder: (context, state) => TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          labelText: AppLocalizations.of(context)!.nationalId,
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return AppLocalizations.of(context)!.nationalIdRequired;
          }
          if (!state.isValidNationalId) {
            return AppLocalizations.of(context)!.invalidNationalId;
          }
          return null;
        },
        onChanged: (value) {
          context
              .read<RegisterBloc>()
              .add(RegisterNationalIdChanged(nationalId: value));
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
