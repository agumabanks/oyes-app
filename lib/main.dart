import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oye/AllScreens/mainscreen.dart';
import 'package:oye/AllScreens/splash.dart';
import 'package:provider/provider.dart';
import 'package:oye/AllScreens/mainscreen.dart';
import 'package:oye/AllScreens/registerationScreen.dart';
import 'package:oye/DataHandler/appData.dart';

import 'AllScreens/loginScreen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("Ride Requests");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Oyes',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/splash',
        // initialRoute: SplashScreen.idScreen,

        routes:
        {
          '/register': (context) => RegisterationScreen(),
          '/login'   : (context) => LoginPage(),
         '/home'      : (context) => MainScreen(),
         '/splash'    : (context) => SplashScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}