import 'dart:ui';

import 'package:cabdriver/widgets/TaxiButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'mainpage.dart';

class ChecklistPage extends StatefulWidget {
  static const String id = 'checklist';

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title){
    final checklistSnackbar = SnackBar(
        content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
    );
    scaffoldKey.currentState.showSnackBar(checklistSnackbar);
  }

  bool brakes = false;
  bool emergencybrakes = false;
  bool horn = false;
  bool seatbelts = false;
  bool headlights = false;
  bool taillights = false;
  bool brakelights = false;
  bool turnlights = false;
  bool reverselights = false;
  bool outsidemirrors = false;
  bool insidemirrors = false;
  bool tirecondition = false;
  bool wheelalignment = false;
  bool sparetyre = false;
  bool toolsfortires = false;
  bool windshieldwipers = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text('Please complete checklist to ensure customer saftey in rides.', style: TextStyle(fontSize: 20.0, fontFamily: 'Brand-Bold'),)),
                SizedBox(height: 10.0,),
                Checkbox(
                    value: brakes,
                    onChanged: (bool value) {
                      setState(() {
                        brakes = value;
                      });
                    }
                ),
                Text('Brakes'),

                Checkbox(
                    value: emergencybrakes,
                    onChanged: (bool value) {
                      setState(() {
                        emergencybrakes = value;
                      });
                    }
                ),
                Text('Emergency Brakes'),

                Checkbox(
                    value: horn,
                    onChanged: (bool value) {
                      setState(() {
                        horn = value;
                      });
                    }
                ),
                Text('Horn'),

                Checkbox(
                    value: seatbelts,
                    onChanged: (bool value) {
                      setState(() {
                        seatbelts = value;
                      });
                    }
                ),
                Text('Seat Belts'),

                Checkbox(
                    value: headlights,
                    onChanged: (bool value) {
                      setState(() {
                        headlights = value;
                      });
                    }
                ),
                Text('Headlights'),

                Checkbox(
                    value: taillights,
                    onChanged: (bool value) {
                      setState(() {
                        taillights = value;
                      });
                    }
                ),
                Text('Tail lights'),

                Checkbox(
                    value: brakelights,
                    onChanged: (bool value) {
                      setState(() {
                        brakelights = value;
                      });
                    }
                ),
                Text('Brake lights'),

                Checkbox(
                    value: turnlights,
                    onChanged: (bool value) {
                      setState(() {
                        turnlights = value;
                      });
                    }
                ),
                Text('Turn lights'),

                Checkbox(
                    value: reverselights,
                    onChanged: (bool value) {
                      setState(() {
                        reverselights = value;
                      });
                    }
                ),
                Text('Reverse lights'),

                Checkbox(
                    value: outsidemirrors,
                    onChanged: (bool value) {
                      setState(() {
                        outsidemirrors = value;
                      });
                    }
                ),
                Text('Outside Mirrors'),

                Checkbox(
                    value: insidemirrors,
                    onChanged: (bool value) {
                      setState(() {
                        insidemirrors = value;
                      });
                    }
                ),
                Text('Inside Mirrors'),

                Checkbox(
                    value: tirecondition,
                    onChanged: (bool value) {
                      setState(() {
                        tirecondition = value;
                      });
                    }
                ),
                Text('Tire Condition'),

                Checkbox(
                    value: wheelalignment,
                    onChanged: (bool value) {
                      setState(() {
                        wheelalignment = value;
                      });
                    }
                ),
                Text('Wheel Alignment'),

                Checkbox(
                    value: sparetyre,
                    onChanged: (bool value) {
                      setState(() {
                        sparetyre = value;
                      });
                    }
                ),
                Text('Spare Tire'),

                Checkbox(
                    value: toolsfortires,
                    onChanged: (bool value) {
                      setState(() {
                        toolsfortires = value;
                      });
                    }
                ),
                Text('Tools for changing tires'),

                Checkbox(
                    value: windshieldwipers,
                    onChanged: (bool value) {
                      setState(() {
                        windshieldwipers = value;
                      });
                    }
                ),
                Text('Windshield Wipers'),


                SizedBox(height: 20.0,),
                TaxiButton(
                  title: 'All Okay',
                  onPressed: () {
                    if( brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('None Selected');
                      showSnackBar('None selected');
                      return;

                    }
                    /*else if(emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false') {
                      print('Only Brakes selected');
                    }
                    else if(brakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Emergency Brakes selected');
                    }
                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false') {
                      print('Only Horn selected');
                    }
                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Seatbelts selected');
                    }
                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Headlights Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Tail Lights Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Brake Lights Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Turn Lights Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Reverse Lights Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Outside Mirrors Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        tirecondition.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Inside Mirrors Selected');
                    }

                    else if(brakes.toString() == 'false' &&
                        emergencybrakes.toString() == 'false' &&
                        horn.toString() == 'false' &&
                        seatbelts.toString() == 'false' &&
                        headlights.toString() == 'false' &&
                        taillights.toString() == 'false' &&
                        brakelights.toString() == 'false' &&
                        turnlights.toString() == 'false' &&
                        reverselights.toString() == 'false' &&
                        outsidemirrors.toString() == 'false' &&
                        insidemirrors.toString() == 'false' &&
                        wheelalignment.toString() == 'false' &&
                        sparetyre.toString() == 'false' &&
                        toolsfortires.toString() == 'false' &&
                        windshieldwipers.toString() == 'false'
                    ) {
                      print('Only Tire Cond Selected');
                    }*/
                    else if(brakes.toString() == 'true' &&
                        emergencybrakes.toString() == 'true' &&
                        horn.toString() == 'true' &&
                        seatbelts.toString() == 'true' &&
                        headlights.toString() == 'true' &&
                        taillights.toString() == 'true' &&
                        brakelights.toString() == 'true' &&
                        turnlights.toString() == 'true' &&
                        reverselights.toString() == 'true' &&
                        outsidemirrors.toString() == 'true' &&
                        insidemirrors.toString() == 'true' &&
                        tirecondition.toString() == 'true' &&
                        wheelalignment.toString() == 'true' &&
                        sparetyre.toString() == 'true' &&
                        toolsfortires.toString() == 'true' &&
                        windshieldwipers.toString() == 'true')
                      {
                        Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
                        print('All Okay!!!!!');
                        showSnackBar('All okay');
                        return;
                      }
                    else{
                      print('Item(s) missing');
                      showSnackBar('Item(s) missing');
                      return;
                    }
                  },
                  color: Colors.blue,
                ),
                SizedBox(height: 40.0,),
              ],

            ),
          ),
      ),
        ),
    );
  }
}
