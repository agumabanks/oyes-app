import 'package:flutter/material.dart';
import 'package:oye/AllWidgets/Divider.dart';
import 'package:oye/AllWidgets/progressDialog.dart';
import 'package:oye/Assistants/requestAssistant.dart';
import 'package:oye/DataHandler/appData.dart';
import 'package:oye/Models/address.dart';
import 'package:oye/Models/placePredictions.dart';

import 'package:provider/provider.dart';

import '../configMaps.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();

  List<PlacePredictions> placePredictionList = [];


  @override
  Widget build(BuildContext context) {


    String placeAddress = Provider.of<AppData>(context).pickUpLocation != null ? Provider.of<AppData>(context).pickUpLocation!.placeName : '';
    // String placeAddress = Provider.of<AppData>(context).pickUpLocation!.placeName;


    pickUpTextEditingController.text = placeAddress;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215.0,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.green,
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7)
                  )
                ]
            ),
            child: Padding(padding: EdgeInsets.only(
              left: 25.0,
              top: 30.0,
              right: 25.0,
              bottom: 20.0,
            ),
              child: Column(
                children: [
                  SizedBox(height: 5.0,),
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Center(
                        child:
                        Text("Set Drop Off", style: TextStyle(fontSize: 18.0, fontFamily: "Raleway", fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),

                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Image.asset("assets/images/marker_pickup.png", height: 16.0, width: 16.0,),
                      SizedBox(width: 18.0,),

                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            controller: pickUpTextEditingController,
                            decoration: InputDecoration(
                              hintText: "PickUp Location",
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                            ),
                          ),
                        ),
                      ),
                      )
                    ],
                  ),

                  // Drop off
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Image.asset("assets/images/destination.png", height: 16.0, width: 16.0,),
                      SizedBox(width: 18.0,),

                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            onChanged: (val){
                              findPlace(val);
                            },
                            controller: dropOffTextEditingController,
                            decoration: InputDecoration(
                              hintText: "Drop Off ? ",
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                            ),
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ),

          // Tile to display predition
          SizedBox(height: 10.0),
          Expanded(
            child: (placePredictionList.length > 0)
                ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0,),
              child: ListView.separated(
                padding: EdgeInsets.all(0.0),
                itemBuilder: (context, index)
                {
                  return PredictionTile(
                    placePrediction: placePredictionList[index],
                  );
                },

                separatorBuilder: (BuildContext contex, int index) => DividerWidget(),
                itemCount: placePredictionList.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              ),
            )
                : Container(),
          )


        ],
      ),
    );
  }
  Future<void> findPlace(String placeName) async {
    if(placeName.length > 1){
      // String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890&components=country:ug";
      String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890";

      var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if(res == "failed")
      {
        return;
      }
      if(res["status"] == "OK"){
        var predictions = res["predictions"];
        var placesList = (predictions as List).map((e) => PlacePredictions.fromJson(e)).toList();

        setState((){
          placePredictionList = placesList;
        });
      }
    }
  }
}

class PredictionTile extends StatelessWidget {
  final PlacePredictions placePrediction;
  const PredictionTile({ required this.placePrediction}) ;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: ()
      {
        getPlaceAddressDeatails(placePrediction.place_id, context);
      },
      child: Container(
        child: Column(
            children: [
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.add_location),
                  SizedBox(width: 14.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0,),
                        Text( placePrediction.main_text, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.0),),
                        SizedBox(height: 8.0,),
                        Text(placePrediction.secondary_text,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                        SizedBox(height: 8.0,),
                      ],
                    ),
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }

  void getPlaceAddressDeatails(String placeId, context) async
  {
    showDialog(context: context,
        builder: (BuildContext context)=> ProgressDialog(message: "Setting Dropoff ...",));

    String placeDetailsUrl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
    var res = await RequestAssistant.getRequest(placeDetailsUrl);
    Navigator.pop(context);
    if (res == "failed")
    {
      return;
    }
    if (res["status"] == "OK")
    {
      Address address = Address(latitude: 0.0, longitude: 0.0, placeName: '', placeId: '', placeFormattedAddress: '',);
      address.placeName = res["result"]["name"];
      address.placeId = placeId;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];

      Provider.of<AppData>(context,listen: false).updateDropOffLocationAddress(address);
      print("this is drop off location::");
      print(address.placeName);

      Navigator.pop(context, "obtainDirection");

    }
  }
}

