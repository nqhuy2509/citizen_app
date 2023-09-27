import 'package:citizen_app/enums/menu.dart';
import 'package:citizen_app/screen/home/home.dart';
import 'package:citizen_app/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.selectedMenu});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, Home.routeName, (route) => false);
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: selectedMenu == MenuState.home
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        AppLocalizations.of(context)!.home,
                        style: TextStyle(
                          color: selectedMenu == MenuState.home
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_rounded,
                        color: selectedMenu == MenuState.recept
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        AppLocalizations.of(context)!.recept,
                        style: TextStyle(
                          color: selectedMenu == MenuState.recept
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: selectedMenu == MenuState.notification
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        AppLocalizations.of(context)!.notification,
                        style: TextStyle(
                          color: selectedMenu == MenuState.notification
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: selectedMenu == MenuState.profile
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        AppLocalizations.of(context)!.profile,
                        style: TextStyle(
                          color: selectedMenu == MenuState.profile
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
