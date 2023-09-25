
import 'package:citizen_app/utils/secure_storage.dart';
import 'package:flutter/cupertino.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static String routeName = '/';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      String? token = await SecureStorageUtils.instance.getToken();

      if(token != null){
        Navigator.pushReplacementNamed(context, '/home');
      }
      else{
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
