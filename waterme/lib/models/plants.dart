import 'package:flutter/material.dart';

class Plant {
  String name;
  String description;
  String url;
  int waterCycle;

  Plant (
    {required this.name, required this.description, required this.url, required this.waterCycle}
    );
}

  List<Plant> plantList = [
    Plant(
      name: "Rose", 
      description: "Roses are erect, climbing, or trailing shrubs, the stems of which are usually copiously armed with prickles of various shapes and sizes, commonly called thorns. The leaves are alternate and pinnately compound (i.e., feather formed), usually with oval leaflets that are sharply toothed.", 
      url: "assets\images\ameen-fahmy-gcWd0ts4RCo-unsplash.jpg", 
      waterCycle: 2, 
      ),
    Plant(
      name: "Amaryllis", 
      description: "Bulb flowering type plants that produce a cluster of attractive trumpet like flowers in different color variations.", 
      url: "lib\images\ameen-fahmy-gcWd0ts4RCo-unsplash.jpg", 
      waterCycle: 14, 
      ),
    Plant(
      name: "African Violet", 
      description: "One of the most popular flowering house plants from the saintpaulia genus. The genus has about 20 species and thousands of varieties.", 
      url: "lib\images\ameen-fahmy-gcWd0ts4RCo-unsplash.jpg", 
      waterCycle: 7, 
      ),
  ];
  