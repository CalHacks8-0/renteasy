import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:renteasy/constants.dart';
import 'package:renteasy/model/rental.dart';
import 'package:renteasy/screens/explore/rental_details.dart';

import '../mapscreen.dart';

class MapsImageWidget extends StatelessWidget {
  Rental house;
  int imgpath_index;
  // List<String> imageList;

  MapsImageWidget(
    this.house,
    this.imgpath_index,
    //  this.imageList,
  );

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("##,##,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ItemDetailScreen(
            //       this.house,
            //       this.imgpath_index,
            //       this.imageList,
            //     ),
            //   ),
            // );
          },
          child: Container(
            height: 160,
            width: screenWidth,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kPrimaryColor,
              // image: DecorationImage(
              //   fit: BoxFit.fill,

              //   image: AssetImage(
              //     imageList[imgpath_index],
              //   ),
              // ),
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
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MapScreen();
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
                                        color: ColorConstant.kFABBackColor)))),
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
                            // Icon(
                            //   Icons.,
                            //   color: Colors.white,
                            // ),
                            Text(
                              "Apply",
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
                            return ItemDetailScreen(Constants.houseList[1], 1);
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
                                        color: ColorConstant.kFABBackColor)))),
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
                            // Icon(
                            //   Icons.,
                            //   color: Colors.white,
                            // ),
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
    );
  }
}
