import 'package:cabdriver/widgets/BrandDivier.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../globalvariabels.dart';

class RatingsTab extends StatefulWidget {
  @override
  _RatingsTabState createState() => _RatingsTabState();
}

class _RatingsTabState extends State<RatingsTab> {
  DatabaseReference ratingRef = FirebaseDatabase.instance.reference().child('drivers/${currentFirebaseUser.uid}/ratings');
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(4.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              SizedBox(height: 20,),

              Text(
                "Your Average Rating",
                style: TextStyle(fontSize: 20.0, fontFamily: "Brand Bold", color: Colors.black54),
              ),

              SizedBox(height: 20,),

              BrandDivider(),

              SizedBox(height: 16.0,),

              SmoothStarRating(
                rating: starCounter,
                color: Colors.yellow,
                allowHalfRating: true,
                starCount: 5,
                size: 45.0,
                isReadOnly: true,
              ),

              SizedBox(height: 14.0,),

              Text(title, style: TextStyle(fontSize: 45.0, fontFamily: "Brand-Bold", color: Colors.yellow),),

            ],
          ),
        ),
      ),
    );
  }
}
