import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thecompany/model/rental.dart';

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
  static List<Rental> rentalList = [
    Rental(
        id: '',
        amount: 850,
        address: '935 Academy Way',
        bedrooms: 3,
        bathrooms: 2,
        geoPoint: const GeoPoint(49.934793318231065, -119.40051134095724),
        owner: "Samir Aliyev",
        rating: 4.5,
        reviews: []),
  ];
}
