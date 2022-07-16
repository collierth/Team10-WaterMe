import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterme/add_plants.dart';
import 'package:waterme/services/notification_services.dart';
import 'package:waterme/widgets/button.dart';
import 'colors.dart' as color;
import 'package:get/get.dart';
import 'add_plants.dart';

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
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column (
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children : [
                Text("My Plants",
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  ),
              ), 
              MyButton(label: "+ Add Plant", onTap: ()=> Get.to(AddPlants()))
              ]
            ),
            SizedBox(height: 30),
            Text("Tip: Plants that you have added will be displayed below.",
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  ),
              ), 
          ]
        )
      ),
    );
  }
}