import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renteasy/screens/home.dart';
import 'package:renteasy/widgets/input_container.dart';
import 'package:renteasy/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../constants.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late String email;
  bool showSpinner = false;

  late String userName;

  late String password;

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: AnimatedOpacity(
        opacity: widget.isLogin ? 0.0 : 1.0,
        duration: widget.animationDuration * 5,
        child: Visibility(
          visible: !widget.isLogin,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: widget.size.width,
              height: widget.defaultLoginSize,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Container(
                        margin: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'assets/images/register.svg',
                          width: 200,
                          height: 200,
                        )),
                    InputContainer(
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        onChanged: (String newValue) {
                          email = newValue;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.mail, color: kPrimaryColor),
                            hintText: 'Email',
                            border: InputBorder.none),
                      ),
                    ),
                    InputContainer(
                      child: TextField(
                        cursorColor: kPrimaryColor,
                        onChanged: (String newValue) {
                          userName = newValue;
                        },
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.face_rounded, color: kPrimaryColor),
                            hintText: 'Name',
                            border: InputBorder.none),
                      ),
                    ),
                    InputContainer(
                      child: TextField(
                        cursorColor: kPrimaryColor,
                        obscureText: true,
                        onChanged: (String newValue) {
                          password = newValue;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock, color: kPrimaryColor),
                            hintText: 'Password',
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      title: 'SIGN UP',
                      ontap: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
