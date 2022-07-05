import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cdate = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: color.AppColor.dmblack,
        color: color.AppColor.dmgrey,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          print(index);
        },
        items: [
          Icon(Icons.home, size: 30, color: color.AppColor.SeafoamGreen),
          Icon(Icons.add, size: 30, color: color.AppColor.SeafoamGreen),
          Icon(Icons.spa, size: 30, color: color.AppColor.SeafoamGreen),
        ]
        ),
      backgroundColor: color.AppColor.dmblack,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Text(
                      "user.location",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(cdate,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                      Text(
                      "location.degrees.f",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
            SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.ForestGreen,
                    color.AppColor.SeafoamGreen,
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