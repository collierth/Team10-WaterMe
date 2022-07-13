import 'package:flutter/material.dart';
import 'colors.dart' as color;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,

      body: Center(
        child: 
        Text("Search"),
      ),
    );
  }
}