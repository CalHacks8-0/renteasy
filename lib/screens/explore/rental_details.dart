import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renteasy/model/rental.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math';
import '../../constants.dart';
import 'components/menu_widget.dart';
import 'mapscreen.dart';

class RentalDetailScreen extends StatelessWidget {
  Rental house;
  List<String> imageList;
  RentalDetailScreen(this.house, this.imageList);
  final houseArray = [
    "1.416",
    "4",
    "2",
    "2",
    // "3",
  ];
  final typeArray = [
    "Size (m^2)",
    "Bedrooms",
    "Bedrooms",
    "Garage",
    // "Kitchen",
  ];
  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 2), () {
      controller.success();
    });
  }

  final houseRating = 4.18;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = NumberFormat("##,##,###", "en_INR");
    final RoundedLoadingButtonController _btnController2 =
        RoundedLoadingButtonController();

    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RoundedLoadingButton(
        successIcon: Icons.done,
        failedIcon: Icons.cottage,
        child: const Text('Apply', style: TextStyle(color: Colors.white)),
        controller: _btnController2,
        onPressed: () => _doSomething(_btnController2),
        borderRadius: 75,
        color: ColorConstant.kFABBackColor,
        successColor: kPrimaryColor,
      ),
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.symmetric(
      //     vertical: 10,
      //     horizontal: 0,
      //   ),
      //   width: screenWidth,
      //   child: Container(
      //     height: 55,
      //     width: 150,
      //     padding: const EdgeInsets.symmetric(horizontal: 35),
      //     child: FloatingActionButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) {
      //               return MapScreen();
      //             },
      //           ),
      //         );
      //       },
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(75.0),
      //       ),
      //       heroTag: null,
      //       child: Ink(
      //         decoration: BoxDecoration(
      //           color: ColorConstant.kFABBackColor,
      //           borderRadius: BorderRadius.circular(75.0),
      //         ),
      //         child: Container(
      //           constraints: const BoxConstraints(
      //             maxWidth: 300.0,
      //             minHeight: 50.0,
      //           ),
      //           alignment: Alignment.center,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const [
      //               Icon(
      //                 Icons.done,
      //                 color: Colors.white,
      //               ),
      //               SizedBox(
      //                 width: 80,
      //                 child: Text(
      //                   "Apply",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: SizedBox(
                      height: 200.0,
                      width: screenWidth,
                      child: Carousel(
                        images: [
                          NetworkImage(imageList[0]),
                          NetworkImage(imageList[1]),
                          NetworkImage(imageList[2])
                        ],
                        showIndicator: true,
                        borderRadius: false,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                        overlayShadow: false,
                        overlayShadowColors: Colors.white,
                        overlayShadowSize: 0.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MenuWidget(
                            iconImg: Icons.arrow_back,
                            iconColor: ColorConstant.kWhiteColor,
                            conBackColor: Colors.transparent,
                            onbtnTap: () {
                              Navigator.of(context).pop(false);
                            }),
                        MenuWidget(
                          iconImg: Icons.favorite_border,
                          iconColor: ColorConstant.kWhiteColor,
                          conBackColor: Colors.transparent,
                          onbtnTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$' + "${oCcy.format(house.amount)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            house.address,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "20 hours ago",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  "House Information",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    color: ColorConstant.kBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating: houseRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                ignoreGestures: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: houseArray.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  18.0,
                                ),
                                color: ColorConstant.kWhiteColor,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                child: Text(
                                  houseArray[index].toString(),
                                  style: GoogleFonts.notoSans(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              typeArray[index],
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: ColorConstant.kGreyColor,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
