import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renteasy/screens/explore/components/image_widget.dart';
import 'package:renteasy/screens/explore/components/image_widget_maps.dart';

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
              child: MapsImageWidget(Constants.houseList[0], 0),
            )));
  }
}
