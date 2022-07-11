import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterme/models/weather_model.dart';
import 'package:waterme/services/weather_api_client.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cdate = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  @override

  Future<void> getData() async {
    data = await client.getCurrentWeather("Atlanta");

  }


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 45, color: color.AppColor.homePageBackground,),
        backgroundColor: color.AppColor.Green,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color.AppColor.SeafoamGreen,
        color: color.AppColor.Green,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          print(index);
        },
        items: [
          Icon(Icons.home, size: 30, color: color.AppColor.homePageBackground),
          Icon(Icons.spa, size: 30, color: color.AppColor.homePageBackground),
          Icon(Icons.settings, size: 30, color: color.AppColor.homePageBackground),
        ]
        ),
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
              height: 150,
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
                    )
                  ],
                )
              )
              
            )
          ]
        ),
      ),
    );
  }

}