import 'package:flutter/material.dart';
import 'package:renteasy/widgets/input_container.dart';

import '../constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: const Icon(Icons.lock, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
