// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:provider/provider.dart';
import 'package:todo_flutter_blockchain/screens/login_screen.dart';
import 'package:todo_flutter_blockchain/services/contract_linking.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => ContractLinking())
      ],
      // create: (_) => ContractLinking(),
      child: MaterialApp(
        title: 'Notes dApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        // home: const HomePage(),
        home: LoginPage(),
        // home: isLoggedin == true ? HomePage() : LoginPage()
      ),
    );
  }
}
