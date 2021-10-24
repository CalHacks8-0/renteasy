import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:thecompany/widgets/input_container.dart';
import 'package:thecompany/widgets/rounded_button.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_app_flutter/at_app_flutter.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:at_utils/at_logger.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../../home.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showSpinner = false;
  late String email;
  Future<AtClientPreference> futurePreference = loadAtClientPreference();
  AtClientPreference? atClientPreference;
  final AtSignLogger _logger = AtSignLogger(AtEnv.appNamespace);

  late String password;

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: AnimatedOpacity(
        opacity: widget.isLogin ? 1.0 : 0.0,
        duration: widget.animationDuration * 4,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  InputContainer(
                    child: TextFormField(
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String newValue) {
                        email = newValue;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.mail, color: kPrimaryColor),
                          hintText: 'Email',
                          border: InputBorder.none),
                    ),
                  ),
                  //const RoundedInput(icon: Icons.mail, hint: 'Email'),
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
                    title: 'LOGIN',
                    ontap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          // var preference = await futurePreference;
                          // setState(() {
                          //   atClientPreference = preference;
                          // });
                          // Onboarding(
                          //   context: context,
                          //   atClientPreference: atClientPreference!,
                          //   domain: 'root.atsign.wtf',
                          //   rootEnvironment: AtEnv.rootEnvironment,
                          //   appAPIKey: '477b-876u-bcez-c42z-6a3d',
                          //   onboard: (value, atsign) {
                          //     _logger.finer('Successfully onboarded $atsign');
                          //   },
                          //   onError: (error) {
                          //     _logger.severe('Onboarding throws $error error');
                          //   },
                          //   nextScreen: Home(),
                          // );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
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
    );
  }
}
