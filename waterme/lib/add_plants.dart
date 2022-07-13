import 'package:flutter/material.dart';
import 'colors.dart' as color;

class AddPlants extends StatefulWidget {
  const AddPlants({Key? key}) : super(key: key);

  @override
  State<AddPlants> createState() => _AddPlantsState();
}

class _AddPlantsState extends State<AddPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,

      body: Center(
        child: 
        Text("Add Plants"),
      ),
    );
  }
}