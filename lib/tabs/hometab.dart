import 'dart:async';

import 'package:cabdriver/brand_colors.dart';
import 'package:cabdriver/datamodels/driver.dart';
import 'package:cabdriver/globalvariabels.dart';
import 'package:cabdriver/helpers/helpermethods.dart';
import 'package:cabdriver/helpers/pushnotificationservice.dart';
import 'package:cabdriver/screens/checklistpage.dart';
import 'package:cabdriver/widgets/AvailabilityButton.dart';
import 'package:cabdriver/widgets/Checklist.dart';
import 'package:cabdriver/widgets/ConfirmSheet.dart';
import 'package:cabdriver/widgets/NotificationDialog.dart';
import 'package:cabdriver/widgets/TaxiButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  DatabaseReference tripRequestRef;

  var geoLocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 4);

  String availabilityTitle = 'GO ONLINE';
  Color availabilityColor = Colors.yellow;

  bool isAvailable = false;


  void getCurrentPosition() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    mapController.animateCamera(CameraUpdate.newLatLng(pos));

  }

  void getCurrentDriverInfo () async {

    currentFirebaseUser = await FirebaseAuth.instance.currentUser();
    DatabaseReference driverRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}');
    driverRef.once().then((DataSnapshot snapshot){

      if(snapshot.value != null){
        currentDriverInfo = Driver.fromSnapshot(snapshot);
        print(currentDriverInfo.fullName);
      }

    });

    PushNotificationService pushNotificationService = PushNotificationService();

    pushNotificationService.initialize(context);
    pushNotificationService.getToken();

    HelperMethods.getHistoryInfo(context);
    getRatings();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentDriverInfo();
  }

  getRatings()
  {
    //update ratings
    DatabaseReference ratingRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/ratings');

    ratingRef.once().then((DataSnapshot snapshot){
      if(snapshot.value != null){
        double ratings = double.parse(snapshot.value.toString());
        setState(() {
          starCounter = ratings;
        });

        if(starCounter <= 1)
        {
          setState(() {
            title = "Very Bad";
          });
          return;
        }
        if(starCounter <= 2)
        {
          setState(() {
            title = "Bad";
          });
          return;
        }
        if(starCounter <= 3)
        {
          setState(() {
            title = "Good";
          });
          return;
        }
        if(starCounter <= 4)
        {
          setState(() {
            title = "Very Good";
          });
          return;
        }
        if(starCounter <= 5)
        {
          setState(() {
            title = "Excellent";
          });
          return;
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(top: 135),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: googlePlex,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
            mapController = controller;

            getCurrentPosition();
          },
        ),
        Container(
          height: 135,
          width: double.infinity,
          color: Colors.blue,
        ),

        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AvailabilityButton(
                title: availabilityTitle,
                color: availabilityColor,
                onPressed: (){

                /*showDialog(
                    context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => CheckListDialog(),
                );*/
                showModalBottomSheet(
                  isDismissible: false,
                    context: context,
                    builder: (BuildContext context) => ConfirmSheet(
                      title: (!isAvailable) ? 'GO ONLINE' : 'GO OFFLINE',
                      subtitle: (!isAvailable) ? 'You are about to become available to receive trip requests': 'you will stop receiving new trip requests',

                      onPressed: (){

                        if(!isAvailable){
                          GoOnline();
                          getLocationUpdates();
                          Navigator.pop(context);

                          setState(() {
                            availabilityColor = Colors.black;
                            availabilityTitle = 'GO OFFLINE';
                            isAvailable = true;
                          });

                        }
                        else{

                          GoOffline();
                          Navigator.pop(context);
                          setState(() {
                            availabilityColor = Colors.yellow;
                            availabilityTitle = 'GO ONLINE';
                            isAvailable = false;
                          });
                        }

                      },
                    ),
                );

                },
              ),
              TaxiButton(
                title: 'Check-List',
                color: Colors.red,
                onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, ChecklistPage.id, (route) => false);
                },
              )
            ],
          ),
        )

      ],
    );
  }

  void GoOnline(){
    Geofire.initialize('driversAvailable');
    Geofire.setLocation(currentFirebaseUser.uid, currentPosition.latitude, currentPosition.longitude);

    tripRequestRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/newtrip');
    tripRequestRef.set('waiting');

    tripRequestRef.onValue.listen((event) {

    });

  }

  void GoOffline (){

    Geofire.removeLocation(currentFirebaseUser.uid);
    tripRequestRef.onDisconnect();
    tripRequestRef.remove();
    tripRequestRef = null;

  }

  void getLocationUpdates(){

    homeTabPositionStream = geoLocator.getPositionStream(locationOptions).listen((Position position) {
      currentPosition = position;

      if(isAvailable){
        Geofire.setLocation(currentFirebaseUser.uid, position.latitude, position.longitude);
      }

      LatLng pos = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(CameraUpdate.newLatLng(pos));

    });

  }
}
