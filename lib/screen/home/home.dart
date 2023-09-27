import 'package:citizen_app/enums/menu.dart';
import 'package:citizen_app/screen/home/home_header.dart';
import 'package:citizen_app/widgets/custom_bottom_navbar.dart';
import 'package:citizen_app/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

import 'home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 20),
            Expanded(
              child: HomeBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
