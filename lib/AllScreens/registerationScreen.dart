// import 'package:oyesdriver/AllScreens/carInfoScreen.dart';
// import 'package:oyesdriver/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:odrivers/src/AllWidgets/progressDialog.dart';
import 'package:oye/AllWidgets/progressDialog.dart';

import '../../main.dart';
// import '../Config.dart';
import '../configMaps.dart';
// import 'CarinfoScreen.dart';

// ignore: must_be_immutable
class RegisterationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController homeAddressTextEditingController = TextEditingController();

  TextEditingController stageTextEditingController = TextEditingController();
  TextEditingController driverIdTextEditingController = TextEditingController();
  TextEditingController ninTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              Image(
                image: AssetImage("assets/images/oyeslogo.png"),
                width: 290.0,
                height: 150.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Register as a Driver",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0, fontFamily: "Raleway"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),


                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),

                    //home address
                    TextField(
                      controller: homeAddressTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter home Address",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: stageTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Stage Address",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: driverIdTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Driver Id",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),

                    TextField(
                      controller: ninTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Nin",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),


                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Raleway"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (nameTextEditingController.text.length < 3) {
                          displayToastMessage(
                              "name must be atleast 3 Characters.", context);
                        } else if (!emailTextEditingController.text
                            .contains("@")) {
                          displayToastMessage(
                              "Email address is not Valid.", context);
                        } else if (phoneTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Phone Number is mandatory.", context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayToastMessage(
                              "Password must be atleast 6 Characters.",
                              context);
                        } else {
                          registerNewUser(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: Text(
                  "Already have an Account? Login Here",
                  style: TextStyle( color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering, Please wait...",
          );
        });

    final User? firebaseUser = (await _firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text)
        .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;

    if (firebaseUser != null) //user created
        {
      //save user info to database
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "password": passwordTextEditingController.text.trim(),
        "homeAddress": homeAddressTextEditingController.text.trim(),
        "Stage": stageTextEditingController.text.trim(),
        "driverId": driverIdTextEditingController.text.trim(),
        "nin": ninTextEditingController.text.trim(),
      };


      driversRef.child(firebaseUser.uid).set(userDataMap);

      currentfirebaseUser = firebaseUser;

      displayToastMessage(
          "Congratulations, your account has been created.", context);

      Navigator.pushNamed(context, '/CarInfoScreen');
    } else {
      Navigator.pop(context);
      //error occured - display error msg
      displayToastMessage("New user account has not been Created.", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:oye/AllScreens/loginScreen.dart';
// import 'package:oye/AllScreens/mainscreen.dart';
// import 'package:oye/AllWidgets/progressDialog.dart';
// import 'package:oye/main.dart';
//
// class RegisterationScreen extends StatelessWidget {
//   static const String idScreen = "register";
//
//   TextEditingController nameTextEditingController = TextEditingController();
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController phoneTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20.0,
//               ),
//               Image(
//                 image: AssetImage("assets/images/ologo.png"),
//                 width: 290.0,
//                 height: 150.0,
//                 alignment: Alignment.center,
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Text(
//                 "Reliable & Genuine",
//                 style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: "Raleway",fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: nameTextEditingController,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         labelText: "Name",
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.0,
//                         ),
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white, fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: emailTextEditingController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.0,
//                         ),
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white,fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: phoneTextEditingController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         labelText: "Phone",
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.0,
//                         ),
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white,fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: passwordTextEditingController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14.0,
//                         ),
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white,fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     RaisedButton(
//                       color: Colors.green[400],
//                       textColor: Colors.black87,
//                       child: Container(
//                         height: 50.0,
//                         child: Center(
//                           child: Text(
//                             "Create Account",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18.0, fontFamily: "Raleway"),
//                           ),
//                         ),
//                       ),
//                       shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(24.0),
//                       ),
//                       onPressed: () {
//                         if (nameTextEditingController.text.length < 3) {
//                           displayToastMessage(
//                               "name must be atleast 3 Characters.", context);
//                         } else if (!emailTextEditingController.text
//                             .contains("@")) {
//                           displayToastMessage(
//                               "Email address is not Valid.", context);
//                         } else if (phoneTextEditingController.text.isEmpty) {
//                           displayToastMessage(
//                               "Phone Number is mandatory.", context);
//                         } else if (passwordTextEditingController.text.length <
//                             6) {
//                           displayToastMessage(
//                               "Password must be atleast 6 Characters.",
//                               context);
//                         } else {
//                           registerNewUser(context);
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, LoginScreen.idScreen, (route) => false);
//                 },
//                 child: Text(
//                   "Already have an Account? Login Here", style: TextStyle(color: Colors.white,fontFamily: "Raleway"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   void registerNewUser(BuildContext context) async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return ProgressDialog(
//             message: "Registering, Please wait...",
//           );
//         });
//
//     final User? firebaseUser = (await _firebaseAuth
//             .createUserWithEmailAndPassword(
//                 email: emailTextEditingController.text,
//                 password: passwordTextEditingController.text)
//             .catchError((errMsg) {
//       Navigator.pop(context);
//       displayToastMessage("Error: " + errMsg.toString(), context);
//     }))
//         .user;
//
//     if (firebaseUser != null) //user created
//     {
//       //save user info to database
//       Map userDataMap = {
//         "name": nameTextEditingController.text.trim(),
//         "email": emailTextEditingController.text.trim(),
//         "phone": phoneTextEditingController.text.trim(),
//         "password": passwordTextEditingController.text.trim(),
//       };
//
//       usersRef.child(firebaseUser.uid).set(userDataMap);
//       displayToastMessage(
//           "Congratulations, your account has been created.", context);
//
//       Navigator.pushNamedAndRemoveUntil(
//           context, MainScreen.idScreen, (route) => false);
//     } else {
//       Navigator.pop(context);
//       //error occured - display error msg
//       displayToastMessage("New user account has not been Created.", context);
//     }
//   }
// }
//
// displayToastMessage(String message, BuildContext context) {
//   Fluttertoast.showToast(msg: message);
// }
