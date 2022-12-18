// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
