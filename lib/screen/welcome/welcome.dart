import 'package:citizen_app/constants/colors.dart';
import 'package:citizen_app/provider/language_provider.dart';
import 'package:citizen_app/screen/login/login.dart';
import 'package:citizen_app/screen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  static String routeName = '/welcome';

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String _version = '';

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        _version = packageInfo.version;
      });
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/citizen-banner.png'),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.subWelcome,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Login.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(AppLocalizations.of(context)!.login),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(child: Divider(
                  thickness: 2,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    AppLocalizations.of(context)!.or,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const Expanded(child: Divider(
                  thickness: 2,
                )),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Register.routeName);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: secondaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(AppLocalizations.of(context)!.register),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    languageProvider.setLocale(const Locale('en'));
                  },
                  child: const Text('English'),
                ),
                const Text('|'),
                TextButton(
                  onPressed: () {
                    languageProvider.setLocale(const Locale('vi'));
                  },
                  child: const Text('Tiếng Việt'),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Version $_version',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
