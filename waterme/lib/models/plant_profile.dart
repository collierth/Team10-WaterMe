import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:waterme/controllers/plant_controller.dart';
import 'package:waterme/models/plants.dart';
import 'package:waterme/colors.dart' as color;
import 'package:get/get.dart';
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/my_plants.dart';
import 'package:waterme/services/notification_services.dart';
import 'package:waterme/widgets/button.dart';


class PlantProfile extends StatelessWidget {
   var notifyHelper=NotifyHelper();
  final Plant plant;
  PlantProfile(this.plant);
  final _plantController = Get.put(PlantController());

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
            Text(plant.species,
              style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 30,),
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
            SizedBox(height: 30,),
            GestureDetector (
              onTap: () async {
                addPlantToDb() async {
                int value =  await _plantController.addSelectedPlant(
                  selectedPlant: SelectedPlant(
                    name: plant.name,
                    staticName: plant.staticName,
                    species: plant.species,
                    description: plant.description,
                    startTime: DateTime.now().toString(),
                    endTime: DateTime.now().add(new Duration(days: plant.waterCycle)).toString(),
                    waterCycle: plant.waterCycle,
                    isCompleted: 0,
                  ),
                );
                  print("My id is "+"$value");
                }
                addPlantToDb();
                Get.back();
                _plantController.getPlants();
              notifyHelper.displayNotification(
              title: "You Added a Plant!",
              body: plant.name+" has been added to My Plants",
              );
            /*notifyHelper.scheduledNotification(
              title: "Scheduled Notification",
              body: plant.name+" added 5 seconds ago",
            );*/
              },
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color.AppColor.Green
              ),
            child: Center (
              child: Text(
                "+ Add Plant",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              ),
              ),
            )
      ),
          ],
         )
      )
    );
  }
}

