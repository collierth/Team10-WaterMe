//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'colors.dart' as color;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: color.AppColor.SeafoamGreen,
      ),

      backgroundColor: Colors.green[50],
      //body: Center(
      //child: Text("Settings"),

      body: Column(
        children: [
          Text(
            'SETTINGS',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Color.fromARGB(215, 2, 66, 5)),
          ),
          //Icon(Icons.arrow_forward_ios, color: Colors.white),
          TextButton(
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
              onPressed: () {}),
          TextButton(
              child: Text('Account',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left),
              onPressed: () {}),
          TextButton(
              child: Text('Notifications',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left),
              onPressed: () {}),
          Text(
            'HELP',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Color.fromARGB(215, 2, 66, 5)),
          ),
          TextButton(
              child: Text(
                'Contact us',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
              onPressed: () {}),
          TextButton(
              child: Text('Knowledge base/FAQ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left),
              onPressed: () {}),
          TextButton(
              child: Text('Terms and Conditions',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left),
              onPressed: () {}),
          TextButton(
            child: Text('Privacy Policy',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left),
            onPressed: () {},
          ),
          TextButton(
              child: Text(
                'About Water Me!',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
