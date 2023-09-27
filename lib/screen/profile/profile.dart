import 'package:citizen_app/enums/menu.dart';
import 'package:citizen_app/repository/auth_repository.dart';
import 'package:citizen_app/screen/profile/bloc/profile_bloc.dart';
import 'package:citizen_app/screen/profile/ui/profile_avatar.dart';
import 'package:citizen_app/screen/profile/ui/setting_list.dart';
import 'package:citizen_app/widgets/custom_bottom_navbar.dart';
import 'package:citizen_app/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  static String routeName = '/profile';

  final ProfileBloc _profileBloc = ProfileBloc(authRepository: AuthRepository());

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => _profileBloc,
      child:
         const Scaffold(
          body: SafeArea(
           child: Column(
             children: [
               ProfileAvatar(),
               SettingList()
             ]
           )
          ),
          floatingActionButton: CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
        )
    );
  }
}
