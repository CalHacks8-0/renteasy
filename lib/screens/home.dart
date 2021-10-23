import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:renteasy/constants.dart';
import 'package:renteasy/screens/chat/chatscreen.dart';
import 'package:renteasy/screens/explore/explorescreen.dart';
import 'package:renteasy/screens/myprofile/myprofile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        containerHeight: 65,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.explore),
            title: const Text("Explore"),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(
              FontAwesomeIcons.comment,
              size: 23,
            ),
            title: const Text("Chat"),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            title: const Text("My Profile"),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return ExploreScreen();
      case 1:
        return ChatScreen();
      case 2:
        return MyProfile();
      default:
        return ExploreScreen();
    }
  }
}
