import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:waterme/add_plants.dart';
import 'package:waterme/colors.dart' as color;
import 'package:waterme/controllers/plant_controller.dart';
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/models/your_profile.dart';
import 'package:waterme/services/notification_services.dart';
import 'package:waterme/widgets/button.dart';
import 'package:waterme/widgets/plant_tile.dart';
import 'package:get/get.dart';
import 'add_plants.dart';

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  var notifyHelper = NotifyHelper();
  final _plantController = Get.put(PlantController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,
      body: Container (
        child: Column (
          children: [
            Container(
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
      Container(
        child: _showPlants(),
      )
          ]
      )
      )
    );
  }

  _showPlants() {
    return Expanded(
              child: Obx((){
                return ListView.builder(
                  itemCount: _plantController.plantList.length,
                  itemBuilder: (_, index) {
                    print(_plantController.plantList.length);
                    SelectedPlant selectedPlant = _plantController.plantList[index];

                    String t = DateFormat.yMd().format(DateTime.now());
                    DateTime et = DateTime.parse(selectedPlant.startTime??"");
                    String t2 = DateFormat.yMd().format(et);

                    for (var i = 0; i < 100; i++)
                    {
                      if (i == selectedPlant.id)
                      {
                        if (t2 == t)
                        {
                          notifyHelper.scheduledNotification(selectedPlant.waterCycle!, selectedPlant.name!, selectedPlant);
                        }
                      }
                    }
                    
                    return AnimationConfiguration.staggeredList(
                      position: index, 
                      child: SlideAnimation(
                        child: FadeInAnimation (
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, selectedPlant);
                                },
                                child: PlantTile(selectedPlant)
                              )
                            ],
                          )
                        )
                      ));
                });
              }),
            );
  }

  _showBottomSheet(BuildContext context, SelectedPlant selectedPlant) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height*0.35,
        color: color.AppColor.homePageBackground,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                initialValue: selectedPlant.name,
                onChanged: (val) {
                  setState(() {
                    selectedPlant.name = val;
                    _plantController.updateName(val, selectedPlant.id!);
                  });
                },
              )
                ],
                
              )
              
            ),
            Spacer(),
            _bottomSheetButton(
                label: "Go to Plant", 
                onTap: () {
                  Get.to(YourProfile(selectedPlant));
                }, 
                clr: color.AppColor.LimeGreen,
                context: context,
                ),
                SizedBox(height: 10,),
                _bottomSheetButton(
                label: "Delete Plant", 
                onTap: () {
                  _plantController.delete(selectedPlant);
                  Get.back();
                }, 
                clr: Colors.red[300]!,
                context: context,
                ),
                SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
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

