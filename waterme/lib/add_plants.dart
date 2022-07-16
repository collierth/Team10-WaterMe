import 'package:flutter/material.dart';
import 'package:waterme/models/plant_profile.dart';
import 'colors.dart' as color;
import 'package:get/get.dart';
import 'package:waterme/models/plants.dart';

class AddPlants extends StatelessWidget {
  const AddPlants({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Add Plant",
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
                ),
              ),
               ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: plantList.length, 
                itemBuilder: (context, index) {
                  Plant plant = plantList[index];
                  return Card(
                    child: ListTile(
                      title: Text(plant.name),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Image.network(plant.url),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: ()=> Get.to(PlantProfile(plant)),
                    ),
                  );
                }
              )
            ],
            
          ),
        ),
       
      )
    );
  }
}