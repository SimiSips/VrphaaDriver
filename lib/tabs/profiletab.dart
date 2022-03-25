import 'package:cabdriver/globalvariabels.dart';
import 'package:cabdriver/screens/login.dart';
import 'package:cabdriver/widgets/BrandDivier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20.0,),
              Text(
                currentDriverInfo.fullName != null ?  currentDriverInfo.fullName : 'Name not Found \n Check Internet Connectivity',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Brand-Bold'
                ),
              ),

              Text(
                title + " driver",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.lightBlueAccent,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Brand-Regular'
                ),
              ),

              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 40.0,),

              InfoCard(
                text: currentDriverInfo.phone != null ? currentDriverInfo.phone : 'Phone Number not found \n Check Internet Connectivity',
                icon: Icons.phone,
                onPressed: () async {
                  print("This is phone number");
                },
              ),

              InfoCard(
                text: currentDriverInfo.email != null ? currentDriverInfo.email : 'Email not found \n Check Internet Connectivity',
                icon: Icons.email,
                onPressed: () async {
                  print("This is email address");
                },
              ),

              InfoCard(
                text: currentDriverInfo.vehicleNumber != null ? currentDriverInfo.vehicleNumber : 'Vehicle Number not found \n Check Internet Connectivity'
                    + " \n"
                    + currentDriverInfo.carModel != null ? currentDriverInfo.carModel : 'Car Model not found \n Check Internet Connectivity'
                    + " \n"
                    + currentDriverInfo.carColor != null ? currentDriverInfo.carColor : 'Car Color not found \n Check Internet Connectivity',
                icon: Icons.car_repair,
                onPressed: () async {
                  print("This is Number plate");
                },
              ),

              GestureDetector(
                onTap: ()
                {
                  Geofire.removeLocation(currentFirebaseUser.uid);
                  //rideRef.onDisconnect();
                  //rideRef.remove();
                  rideRef = null;

                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
                },
                child: Card(
                  color: Colors.amber,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                  child: ListTile(
                    trailing: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Sign out",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Brand-Bold',
                      ),
                    )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget
{
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontFamily: 'Brand-Bold',
            ),
          ),
        ),
      ),
    );
  }
}
