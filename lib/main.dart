import 'dart:async';

import 'package:flutter/material.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:at_utils/at_logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:at_app_flutter/at_app_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thecompany/screens/home.dart';
import 'package:thecompany/screens/login/login.dart';
import 'package:flutter_config/flutter_config.dart';

import 'constants.dart';
// void main() {
//   AtEnv.load();
//   runApp(const MyApp());
// }

Future<AtClientPreference> loadAtClientPreference() async {
  var dir = await path_provider.getApplicationSupportDirectory();
  return AtClientPreference()
        ..rootDomain = AtEnv.rootDomain
        ..namespace = AtEnv.appNamespace
        ..hiveStoragePath = dir.path
        ..commitLogPath = dir.path
        ..isLocalStoreRequired = true
      // TODO set the rest of your AtClientPreference here
      ;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AtEnv.load();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<AtClientPreference> futurePreference = loadAtClientPreference();
  AtClientPreference? atClientPreference;

  final AtSignLogger _logger = AtSignLogger(AtEnv.appNamespace);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentEazy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      home: Login(
        afterLoginSuccess: () async {
          var preference = await futurePreference;
          setState(() {
            atClientPreference = preference;
          });
          Onboarding(
            context: context,
            atClientPreference: atClientPreference!,
            domain: FlutterConfig.get('domain'),
            rootEnvironment: AtEnv.rootEnvironment,
            appAPIKey: FlutterConfig.get('appAPIKey'),
            onboard: (value, atsign) {
              _logger.finer('Successfully onboarded $atsign');
            },
            onError: (error) {
              _logger.severe('Onboarding throws $error error');
            },
            nextScreen: Home(),
          );
        },
      ),
    );
  }
}
