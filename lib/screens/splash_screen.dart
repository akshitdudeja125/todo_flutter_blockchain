import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // final sp = context.read<SignInProvider>();
    super.initState();
    // if (sp.isSignedIn == true) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );
    // } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
