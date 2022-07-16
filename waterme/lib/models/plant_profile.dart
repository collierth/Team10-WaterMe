import 'package:flutter/material.dart';
import 'package:waterme/models/plants.dart';
import 'package:waterme/colors.dart' as color;
import 'package:get/get.dart';
import 'package:waterme/my_plants.dart';
import 'package:waterme/widgets/button.dart';

class PlantProfile extends StatelessWidget {
  final Plant plant;

  PlantProfile(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,
          size: 30,
          color: Colors.black
          )
        ),
      ),
      body: Container(
         padding: const EdgeInsets.only(left: 30, right: 30),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(plant.name,
              style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 30,),
            Image.network(
              plant.url
            ),
             Text(plant.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
              )
             ),
             SizedBox(height: 30,),
            Text("Water every "+plant.waterCycle.toString()+" days",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            
          ],
         )
      )
    );
  }
}
