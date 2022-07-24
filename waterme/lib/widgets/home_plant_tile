import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/colors.dart' as color;

class HomePlantTile extends StatelessWidget {
  final SelectedPlant? selectedPlant;
  HomePlantTile(this.selectedPlant);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding:
      //EdgeInsets.symmetric(horizontal: 40),
      width: 150,
      height:80,
      margin: EdgeInsets.only(right: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
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
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(50),
          ),
          boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 15,
                    color: Colors.black.withOpacity(0.5)
                  )
                ],
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedPlant?.name??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  overflow: TextOverflow.fade,
                        softWrap: false,
                ), 
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.white,
          ),
          selectedPlant!.isCompleted == 1 ?
          Icon(Icons.check,
          color: Colors.white,) : Icon(Icons.announcement,
          color: Colors.yellow,),
        ]),
      ),
    );
  }

  
}