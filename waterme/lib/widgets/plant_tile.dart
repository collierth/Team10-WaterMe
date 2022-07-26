import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterme/models/selected_plant.dart';
import 'package:waterme/colors.dart' as color;

class PlantTile extends StatelessWidget {
  final SelectedPlant? selectedPlant;
  PlantTile(this.selectedPlant);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
                  colors: [
                    color.AppColor.Green,
                    color.AppColor.LimeGreen,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight, 
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.5)
                  )
                ]
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
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.grass,
                      color: Colors.grey[200],
                      size: 25,
                    ),
                    SizedBox(width: 5,),
                    Text(selectedPlant?.staticName??"",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    )
                  ]
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