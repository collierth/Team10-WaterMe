import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:waterme/add_plants.dart';
import 'package:waterme/home_page.dart';
import 'package:waterme/my_plants.dart';
import 'package:waterme/search.dart';
import 'package:waterme/settings.dart';

import 'colors.dart' as color;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView (
        context,
        controller: _controller,
        screens: const [
          HomePage(),
          MyPlants(),
          AddPlants(),
          Search(),
          Settings(),
        ],
        items: _navBarItems(),
        navBarStyle: NavBarStyle.style3,
        ), 
    );
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: color.AppColor.LimeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.tree),
      title: ("My Plants"),
      activeColorPrimary: color.AppColor.LimeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.add),
      title: ("Add"),
      activeColorPrimary: color.AppColor.LimeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: ("Search"),
      activeColorPrimary: color.AppColor.LimeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: color.AppColor.LimeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
  ];
}
}






