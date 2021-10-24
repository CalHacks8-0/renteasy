import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:thecompany/constants.dart';
import 'package:thecompany/screens/chat/chats_screen.dart';
import 'package:thecompany/screens/chat/contact_screen.dart';
import 'package:thecompany/screens/explore/explorescreen.dart';
import 'package:thecompany/screens/myprofile/myprofile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> isLandlord() async {
    var result = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: "aliyev7138@gmail.com")
        .get();
    print('Result is: ${result}');
    return Future.value(false);
  }

  @override
  void initState() {
    isLandlord();
    super.initState();
  }

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
        return const ContactScreen();
      case 2:
        return const MyProfile();
      default:
        return ExploreScreen();
    }
  }
}
