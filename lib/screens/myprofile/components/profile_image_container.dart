import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:thecompany/constants.dart';
import 'package:thecompany/model/rental.dart';
import 'package:thecompany/screens/explore/rental_details.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ProfileImageWidget extends StatelessWidget {
  Rental house;
  // List<String> imageList;
  List<String> imageLinks;
  ProfileImageWidget(
    this.house,
    this.imageLinks,
    //  this.imageList,
  );

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 2), () {
      controller.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    final oCcy = NumberFormat("##,##,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;
    final RoundedLoadingButtonController _btnController2 =
        RoundedLoadingButtonController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RentalDetailScreen(
                    house,
                    imageLinks,
                  ),
                ),
              );
            },
            child: Container(
              height: 160,
              width: screenWidth,
              padding: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // color: kPrimaryColor,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imageLinks[1],
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                        height: 50.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: const Center(
                            child: Text(
                          "Tenancy Ending in 2 months",
                          style: TextStyle(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 15,
                      bottom: 10,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "\$" + "${oCcy.format(house.amount)}",
                          style: GoogleFonts.notoSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          house.address,
                          style: GoogleFonts.notoSans(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                      bottom: 10,
                    ),
                    child: Text(
                      house.bedrooms.toString() +
                          " bedrooms / " +
                          house.bathrooms.toString() +
                          " bathrooms / " +
                          house.rating.toString() +
                          " ⭐",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return RatingDialog(
                                image: const Icon(
                                  Icons.rate_review,
                                  size: 70,
                                  color: kPrimaryColor,
                                ), // set your own image/icon widget
                                title: const Text("Rate your landlord"),
                                starColor: kPrimaryColor,
                                message: const Text(
                                  "We use this information to help other tenants find great home owners.",
                                  style: TextStyle(fontSize: 13),
                                ),
                                enableComment: true,
                                submitButtonText: "SUBMIT",
                                onSubmitted: (RatingDialogResponse response) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Your feedback makes our community better")));
                                },
                                starSize: 30,
                              );
                            });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(1)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorConstant.kFABBackColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(75.0),
                                      side: const BorderSide(
                                          color:
                                              ColorConstant.kFABBackColor)))),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: ColorConstant.kFABBackColor,
                          borderRadius: BorderRadius.circular(75.0),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 300.0,
                            minHeight: 50.0,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Rate Landlord",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RentalDetailScreen(
                                  Constants.rentalList[0], const [
                                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img2.jpg?alt=media&token=6c59753d-5038-4b5a-980f-f300dbfc20c3',
                                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img3.jpg?alt=media&token=ecc3c191-5164-47dd-879e-7f5946c3957c',
                                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img1.jpg?alt=media&token=199ff84b-85b9-406e-aa84-3dbb0d7cc87e'
                              ]);
                            },
                          ),
                        );
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(1)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorConstant.kFABBackColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(75.0),
                                      side: const BorderSide(
                                          color:
                                              ColorConstant.kFABBackColor)))),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: ColorConstant.kFABBackColor,
                          borderRadius: BorderRadius.circular(75.0),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 300.0,
                            minHeight: 50.0,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Details",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
