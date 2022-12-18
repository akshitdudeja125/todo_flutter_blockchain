// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_import, unused_element, avoid_print, unused_field

import 'dart:convert';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter_blockchain/screens/home_screen.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: size.height * 0.2,
              top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hello, \nWelcome Back",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: size.width * 0.1,
                    ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                      color: tdGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email or Phone number"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: const BoxDecoration(
                        color: tdGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot Password?",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: tdWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/logos/google.jpg'),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (kDebugMode) print('Facebook');
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/logos/facebook.jpg'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
