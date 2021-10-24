import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecompany/screens/explore/components/image_widget_maps.dart';

import '../../../constants.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            top: false,
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(5),
              child: MapsImageWidget(Constants.rentalList[0], const [
                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img2.jpg?alt=media&token=6c59753d-5038-4b5a-980f-f300dbfc20c3',
                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img3.jpg?alt=media&token=ecc3c191-5164-47dd-879e-7f5946c3957c',
                'https://firebasestorage.googleapis.com/v0/b/calhacksbackend.appspot.com/o/h6Img1.jpg?alt=media&token=199ff84b-85b9-406e-aa84-3dbb0d7cc87e'
              ]),
            )));
  }
}
