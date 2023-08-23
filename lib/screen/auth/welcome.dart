import 'package:citi_zen_app/provider/language_provider.dart';
import 'package:citi_zen_app/screen/auth/login.dart';
import 'package:citi_zen_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

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
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                Routes.instance
                    .pushAndRemoveUtil(widget: const Login(), context: context);
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: Text(
                AppLocalizations.of(context)!.letsStart,
                style: const TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
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

            // I want to a dropdown select language here
            // DropdownButton(
            //   value: languageProvider.locale.languageCode,
            //   items: const [
            //     DropdownMenuItem(child: Text('English'), value: 'en'),
            //     DropdownMenuItem(child: Text('Tiếng Việt'), value: 'vi'),
            //   ],
            //   onChanged: (value) {
            //     languageProvider.setLocale(Locale(value!));
            //   },
            //   underline: Container(
            //     height: 2,
            //     color: Theme.of(context).primaryColor,
            //   ),
            // ),
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
