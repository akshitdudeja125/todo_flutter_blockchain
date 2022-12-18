// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_blockchain/services/auth_service.dart';

import '../screens/login_screen.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(32, 33, 36, 1),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          GestureDetector(
            onTap: () async {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: Container(
              child: CircleAvatar(
                radius: 20,
                backgroundImage: const NetworkImage(
                    'https://avatars.githubusercontent.com/u/55044774?v=4'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
