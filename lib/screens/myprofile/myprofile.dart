import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import 'components/profile_image_container.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  // function to build the apartment card
  Card getApartmentCard(BuildContext context, name, address) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/default-apartment.jpg"),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(address)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Color.fromRGBO(96, 122, 200, 1),
                          Color.fromRGBO(137, 169, 221, 1)
                        ])),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xffffffff)),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 55, horizontal: 20),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://source.unsplash.com/random/"),
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Brice Seraphin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xffffffff)))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                        "assets/icons/phone.svg",
                                        semanticsLabel: "Phone"),
                                    onPressed: () =>
                                        {print("Opening the dialer")},
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                        "assets/icons/location.svg",
                                        semanticsLabel: "Location"),
                                    onPressed: () =>
                                        {print("Opening the dialer")},
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )),
            ProfileImageWidget(Constants.rentalList[0], const [
              'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h3Img1.jpg?alt=media&token=40e9885f-e9d1-4727-b618-34d082f7ad57',
              'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h3Img2.jpg?alt=media&token=ce724f47-6fc5-4c5e-9cad-c1cb5d75936c',
              'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h2Img3.jpg?alt=media&token=261e8227-e66b-40ed-af41-62069dcafde2'
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 12),
                      child: Text(
                        "Previous Apartment",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // list the current Apartment
                    Column(
                      children: [
                        getApartmentCard(context, "Ellipse Residence",
                            "356B Baker Street, Earth"),
                        getApartmentCard(context, "Delta Residence",
                            "495B Baker Street, Earth"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
