import 'dart:convert';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterme/add_plants.dart';
import 'package:waterme/controllers/plant_controller.dart';
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/models/weather_model.dart';
import 'package:waterme/services/notification_services.dart';
import 'package:waterme/services/weather_api_client.dart';
import 'package:waterme/widgets/home_plant_tile.dart';

import 'colors.dart' as color;
import 'my_plants.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cdate = DateFormat.yMMMMd().format(DateTime.now());
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }
  final _plantController = Get.put(PlantController());

  Future<void> getData() async {
    data = await client.getCurrentWeather("Atlanta");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.SeafoamGreen,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      "${data!.cityName}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(cdate,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                      Text(
                      "${data!.temp?.toInt()}°F",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                      Text(
                        "${data!.description}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                      ],
                    );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center (
                    child: CircularProgressIndicator(),
                  );
                }
                
                return Container();
              },
            ),
                    
            SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.Green,
                    color.AppColor.LimeGreen,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight, 
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ), 
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.5)
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 15,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Water Me!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                        "Add a Plant!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (() => Get.to(AddPlants())),
                        child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white
                          ),
                          color: Colors.transparent,
                        ),
                        child: Center (
                          child: Text(
                          "Get Started ",
                          style: TextStyle(
                            color: Colors.white,
                          ),

                        ),
        )
      ),
                      )
                  ],
                )
              )
            ),
            SizedBox(height: 30,),
            Container(
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: color.AppColor.Green,
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                dayTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                monthTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            SizedBox(height: 10,),
            Text("Tip: Current and upcoming watering dates will appear here",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),),
            Container(
              child: _showPlants(),
            )
          ]
        ),
      ),
    );
  }

  _showPlants() {
    return Expanded(
              child: Obx((){
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantController.plantList.length,
                  itemBuilder: (_, index) {
                    SelectedPlant selectedPlant = _plantController.plantList[index];

                    String t = DateFormat.yMd().format(_selectedDate);
                    DateTime et = DateTime.parse(selectedPlant.endTime??"");
                    String t2 = DateFormat.yMd().format(et);
                    print(t2);
                    print(_selectedDate);
                    

                    if (t2==t)
                    {
                      
                        return AnimationConfiguration.staggeredList(
                      position: index, 
                      child: SlideAnimation(
                        child: FadeInAnimation (
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: HomePlantTile(selectedPlant)
                              )
                            ],
                          )
                        )
                      ));
                    } else {
                      return Container();
                    }
                    
                });
              }),
            );
  }

}