import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:odrivers/src/AllScreens/registerationScreen.dart';
// import 'package:odrivers/src/AllWidgets/progressDialog.dart';
import 'package:oye/AllWidgets/progressDialog.dart';

import '../../main.dart';
// import '../Config.dart';
import '../configMaps.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                height: 75.0,
              ),
              Image(
                image: AssetImage("assets/images/ologo.png"),
                width: 290.0,
                height: 150.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Login as a Driver",
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
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.green[400],
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Raleway"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage(
                              "Email address is not Valid.", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Password is mandatory.", context);
                        } else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/register', (route) => false);
                },
                child: Text(
                  "Do not have an Account? Register Here", style: TextStyle( color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating, Please wait...",
          );
        });

    final User? firebaseUser = (await _firebaseAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text)
        .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          currentfirebaseUser = firebaseUser;
          Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false);
          displayToastMessage("you are logged-in now.", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "No record exists for this user. Please create new account.",
              context);
        }
      });
    } else {
      Navigator.pop(context);
      displayToastMessage("Error Occured, can not be Signed-in.", context);
    }
  }
}



displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:oye/AllScreens/mainscreen.dart';
// import 'package:oye/AllScreens/registerationScreen.dart';
// import 'package:oye/AllWidgets/iinputField2.dart';
// import 'package:oye/AllWidgets/iinputField2Password.dart';
// import 'package:oye/AllWidgets/progressDialog.dart';
// import 'package:oye/configMaps.dart';
// import 'package:oye/main.dart';
//
// class LoginScreen extends StatefulWidget {
//   static const String idScreen = "login";
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 135.0,
//               ),
//               Image(
//                 image: AssetImage("assets/images/ologo.png"),
//                 width: 290.0,
//                 height: 150.0,
//                 alignment: Alignment.center,
//               ),
//               SizedBox(
//                 height: 1.0,
//               ),
//               Text(
//                 "Oyes User Login",
//                 style: TextStyle( color: Colors.greenAccent, fontSize: 24.0, fontFamily: "Raleway",fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 15.0,
//                     ),
//
//                     Container(
//                         margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: IInputField2(
//                             controller: emailTextEditingController,
//
//                             hint: "Login",            // "Login"
//                             icon: Icons.alternate_email,
//                             colorDefaultText: Colors.white,
//                             colorBackground: Colors.black54,
//                             // controller: editControllerName,
//                             type: TextInputType.emailAddress, onChangeText: (String ) {  }, onPressRightIcon: (){},
//                           // iconRight: icon,
//                         )
//                     ),
//
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                         margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: IInputField2Password(
//                           controller: passwordTextEditingController,
//
//                           hint: "Password",            // "Password"
//                           icon: Icons.vpn_key,
//                           colorDefaultText: Colors.white,
//                           colorBackground: Colors.black54,  onChangeText: (String ) {  },
//                           // controller: editControllerPassword,
//                         )),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     RaisedButton(
//                       color: Colors.green[700],
//                       textColor: Colors.white,
//                       child: Container(
//                         height: 50.0,
//                         child: Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 18.0, fontFamily: "Raleway",fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(24.0),
//                       ),
//                       onPressed: () {
//                         if (!emailTextEditingController.text.contains("@")) {
//                           displayToastMessage(
//                               "Email address is not Valid.", context);
//                         } else if (passwordTextEditingController.text.isEmpty) {
//                           displayToastMessage(
//                               "Password is mandatory.", context);
//                         } else {
//                           loginAndAuthenticateUser(context);
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, RegisterationScreen.idScreen, (route) => false);
//                 },
//                 child: Text(
//                   "Do not have an Account? Register Here",style: TextStyle(color: Colors.white),
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
//   void loginAndAuthenticateUser(BuildContext context) async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return ProgressDialog(
//             message: "Authenticating, Please wait...",
//           );
//         });
//
//     final User? firebaseUser = (await _firebaseAuth
//             .signInWithEmailAndPassword(
//                 email: emailTextEditingController.text,
//                 password: passwordTextEditingController.text)
//             .catchError((errMsg) {
//       Navigator.pop(context);
//       displayToastMessage("Error: " + errMsg.toString(), context);
//     })).user;
//
//     if (firebaseUser != null) {
//       usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
//         if (snap.value != null) {
//           Navigator.pushNamedAndRemoveUntil(
//               context, MainScreen.idScreen, (route) => false);
//           displayToastMessage("you are logged-in now.", context);
//         } else {
//           Navigator.pop(context);
//           _firebaseAuth.signOut();
//           displayToastMessage(
//               "No record exists for this user. Please create new account.",
//               context);
//         }
//       });
//     } else {
//       Navigator.pop(context);
//       displayToastMessage("Error Occured, can not be Signed-in.", context);
//     }
//   }
// }
