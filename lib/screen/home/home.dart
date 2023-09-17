import 'package:citi_zen_app/enums/menu.dart';
import 'package:citi_zen_app/screen/home/home_header.dart';
import 'package:citi_zen_app/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  bool keyboardIsVisible(BuildContext context) {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
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
      floatingActionButton: Visibility(
        visible: !keyboardIsVisible(context),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.qr_code_scanner),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
