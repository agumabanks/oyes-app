import 'package:firebase_auth/firebase_auth.dart';
import 'package:oye/Models/allUsers.dart';

String mapKey = "AIzaSyBLV7mu49-p4Hgme7BLDBzvnPmIBIL2FQM";

User firebaseUser = '' as User;

Users userCurrentInfo = '' as Users;

User currentfirebaseUser = '' as User;

int driverRequestTimeOut = 40;
String statusRide = "";
String rideStatus = "Driver is Coming";
String carDetailsDriver = "";
String driverName = "";
String driverphone = "";

double starCounter = 0.0;
String title="";
String carRideType="";

FirebaseAuth auth = FirebaseAuth.instance;
// Firestore firebaseFiretore = Firestore.instance;
// FirebaseMessaging fcm = FirebaseMessaging();



String serverToken = "key=AAAA69uJwiQ:APA91bFzjD35yH88XFhnHyj_GBI6tW2fZbkpLFwdIieO8IUx7dlkFDAxxj8XUBFjZ6fqAYzAx1jeh2WuLZCArZT3X1OsM3JObdE5OonpdOLD4wNilFToljg6meRpF3z14-qk-eSwXhmu";