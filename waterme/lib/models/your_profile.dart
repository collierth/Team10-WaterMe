import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waterme/controllers/plant_controller.dart';
import 'package:waterme/colors.dart' as color;
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/services/notification_services.dart';

class YourProfile extends StatelessWidget{
  @override
  final _plantController = Get.put(PlantController());
  final SelectedPlant? selectedPlant;
  YourProfile(this.selectedPlant);
  DateTime now = DateTime.now();
  var notifyHelper=NotifyHelper();

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
      body: SingleChildScrollView(
        child: Container(
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
             
             selectedPlant!.isCompleted==1
            ?Container(
              child: Text("Your plant is doing good for now. \n\nCheck back later!", 
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
            )
              : _waterButton(
                label: "Complete Watering", 
                onTap: () {
                  int? wc = selectedPlant?.waterCycle;
                  DateTime in2d = DateTime.now().add(new Duration(days: wc!));
                  String newEndTime = in2d.add(new Duration(days: wc)).toString();
                  _plantController.markPlantCompleted(selectedPlant!.id!);
                  _plantController.updateEndTime(newEndTime, selectedPlant!.id!);

                  notifyHelper.displayNotification(
                  title: "Watering completed",
                  body: selectedPlant!.name!+" has been watered!",
                  );
                }, 
                clr: color.AppColor.LimeGreen,
                context: context,
                ),
             
             
        SizedBox(height: 50,),
              Text("Overview",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic
              )
             ),
            SizedBox(height: 10,),
             Text(selectedPlant?.staticName??"",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              )
             ),
             Text(selectedPlant?.species??"",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic
              )
             ),
             SizedBox(height: 10,),
             Text(selectedPlant?.description??"",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
              )
             ),
             SizedBox(height: 30,),
             _endTimeParser(),
             SizedBox(height: 50,),
            
          ],
         )
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

  _waterButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }){
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width*0.9,
          
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: clr
            ),
            borderRadius: BorderRadius.circular(20),
            color: clr,
          ),
          child:  Center(
            child: Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          )
        ),
      );
  }
}