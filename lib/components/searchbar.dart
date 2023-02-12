import 'package:flutter/material.dart';
import 'constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kwhite,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: kdarkpurple,),
          hintText: "Search for results",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16.0),
          suffixIcon: Icon(Icons.tune, color: kdarkpurple,),
        ),
      ),
      

    );
  }
}