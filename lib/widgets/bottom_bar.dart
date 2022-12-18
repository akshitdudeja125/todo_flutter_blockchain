import 'package:flutter/material.dart';
import 'package:todo_flutter_blockchain/utils/colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: tdGrey,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 10,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 20,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.menu,
                size: 30,
              ),
              Icon(
                Icons.search,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
