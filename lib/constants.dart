import 'package:flutter/material.dart';
import 'package:renteasy/model/rental.dart';

const kPrimaryColor = Color(0xFF90BBC6);
const kBackgroundColor = Color(0XFFF2F2F2);
const kSecondaryColor = Color(0xFFC2F1F4);

class ColorConstant {
  static const kFABBackColor = Color(0xFF12192b);
  static const kFilterBackColor = Color(0xfff5f7fa);
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kGreyColor = Colors.grey;
  static const kGreenColor = Colors.green;
}

class Constants {
  static List<Rental> houseList = [
    Rental(
        id: 1,
        amount: 975,
        address: 'Random Road 49428',
        bedrooms: 3,
        bathrooms: 2,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
    Rental(
        id: 2,
        amount: 800,
        address: 'Random Road 55555',
        bedrooms: 4,
        bathrooms: 4,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
    Rental(
        id: 3,
        amount: 1200,
        address: 'Random Road 49428',
        bedrooms: 5,
        bathrooms: 2,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
    Rental(
        id: 4,
        amount: 800,
        address: 'Random Road 55555',
        bedrooms: 3,
        bathrooms: 4,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
    Rental(
        id: 5,
        amount: 975,
        address: 'Random Road',
        bedrooms: 4,
        bathrooms: 2,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
    Rental(
        id: 6,
        amount: 600,
        address: 'Random Road',
        bedrooms: 5,
        bathrooms: 4,
        latitude: "31",
        longitude: "31",
        owner: "Me",
        rating: 99,
        review1: "Amazing",
        review2: "Excellent"),
  ];
}
