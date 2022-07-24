import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waterme/controllers/plant_controller.dart';
import 'package:waterme/colors.dart' as color;
import 'package:waterme/models/selected_plant.dart';

class YourProfile extends StatelessWidget{
  @override
  final _plantController = Get.put(PlantController());
  final SelectedPlant? selectedPlant;
  YourProfile(this.selectedPlant);

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
          child: Icon(Icons.arrow_back,
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
            Text(selectedPlant?.name??"",
              style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
              ),
            ),
             _startTimeParser(),
             SizedBox(height: 20,),
             
             
        SizedBox(height: 200,),
              Text("Overview",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic
              )
             ),
             Text(selectedPlant?.description??"",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
              )
             ),
             SizedBox(height: 30,),
             _endTimeParser(),
            
          ],
         )
      )
    );
  }

  _startTimeParser() {
    DateTime st = DateTime.parse(selectedPlant?.startTime??"");
    String filteredST = DateFormat.yMMMMd().format(st);
    return Text("Added "+filteredST,
    style: TextStyle(
      fontSize: 15,
    ),);
  }

  _endTimeParser() {
    DateTime et = DateTime.parse(selectedPlant?.endTime??"");
    String filteredET = DateFormat.MMMd().format(et);
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
            color: color.AppColor.Green,
            shape: BoxShape.circle,
          ),
          child: Container(
            child: Icon(Icons.water_drop,
            size: 30, color: Colors.white)
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Water",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            Text(filteredET,
              style: TextStyle(
              fontSize: 20,
            ),)
          ],
        )
      ]
    );
    
    
    


  }
}