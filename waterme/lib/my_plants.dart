import 'package:flutter/material.dart';
import 'colors.dart' as color;

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,

      body: Center(
        child: 
        Text("My Plants"),
      ),
    );
  }
}