import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renteasy/screens/explore/mapscreen.dart';

import '../../constants.dart';
import 'components/image_widget.dart';

class ExploreScreen extends StatelessWidget {
  final filterArray = [
    "<\$220.000",
    "For sale",
    "3-4 beds",
    "Kitchen",
  ];

  @override
  Widget build(BuildContext context) {
    //    final oCcy = new NumberFormat("##,##,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 55,
        width: 150,
        child: FloatingActionButton(
          elevation: 5,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75.0),
          ),
          heroTag: null,
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
                  Icon(
                    Icons.explore,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Map View",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 15,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                            size: 15,
                          ),
                          Text(
                            "Location",
                            style: GoogleFonts.notoSans(
                              fontSize: 14,
                              color: ColorConstant.kBlackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Kelowna, BC",
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          color: ColorConstant.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // color: conBackColor,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Icon(
                        Icons.notifications_on,
                        color: ColorConstant.kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF3E4067),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 3),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.16),
                      spreadRadius: -2,
                    )
                  ],
                ),
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: "Search rentals",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF464A7E),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: ColorConstant.kGreyColor,
                thickness: .2,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  Constants.houseList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ImageWidget(
                        Constants.houseList[index],
                        index,
                        // Constants.imageList,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
