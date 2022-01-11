import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oye/AllWidgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:oye/AllScreens/mainscreen.dart';


class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);
  static const String idScreen = "splashScreen";


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), openHome);
  }
  void openHome(){
    Navigator.pushNamedAndRemoveUntil(
        context, FirebaseAuth.instance.currentUser == null ? '/login' : '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/ologo.png",
          width: 200,),
          SizedBox(height: 15.0),
          Text("Reliable & Genuine",style: TextStyle(color: Colors.white, fontFamily: "Raleway",),),
          SizedBox(height: 15.0),
          Loading()
        ],
      ),
    );
  }
}
