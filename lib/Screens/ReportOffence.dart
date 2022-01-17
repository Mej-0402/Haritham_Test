import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ReportOffence extends StatefulWidget {
  const ReportOffence({Key? key}) : super(key: key);

  @override
  State<ReportOffence> createState() => _ReportOffenceState();
}

class _ReportOffenceState extends State<ReportOffence> {
  // Initial Selected Value
  String dropdownvalue = 'Offence Type 1';

  // List of items in our dropdown menu
  var items = [
    'Offence Type 1',
    'Offence Type 2',
    'Offence Type 3',
    'Offence Type 4',
    'Offence Type 5',
  ];
  final double coverHeight = 280;
  final double avatarHeight = 100;
  File? imageFile;
  late String? imagepath;
  var _latitude = "";
  var _longitude = "";
  var _altitude = "";
  var _speed = "";
  var _address = "";

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();
      _address = pm[0].toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location Services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permision are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location Permissions are permanently denied ,we cannot request permission");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    // final bottom = ;
    final top = coverHeight - avatarHeight / 2;
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        buidTop(),
        buildContent(),
        buildAddress(),
        buildOffence(),
        buildDescription(),
        buildLocation(),
        buildButton(),
      ]),
    );
  }

  Widget buidTop() =>
      Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
        if (imageFile != null)
          Container(
              margin: EdgeInsets.only(bottom: avatarHeight / 2),
              child: displayImage())
        else
          buildImage(),
        //
        //

        Positioned(top: coverHeight - avatarHeight / 2, child: buildCamera()),
        // buildLocation(),
      ]);

  Widget buildImage() => Container(
        width: double.infinity,
        height: coverHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/harithamreport1.jpeg"),
                fit: BoxFit.fill),
            // color: Colors.grey,
            //  border: Border.all(width: 8, color: Colors.black),
            borderRadius: BorderRadius.circular(12.0)),
        child: const Text(
          "No image selected",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget displayImage() => Container(
        width: double.infinity,
        height: coverHeight,
        // alignment: Alignment.center,
        //  margin: const EdgeInsets.only(top: 40),

        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
                //fit: BoxFit.cover,
                image: FileImage(imageFile!),
                fit: BoxFit.fill),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
        ),
      );
  Widget buildCamera() => CircleAvatar(
        radius: avatarHeight / 2,
        backgroundColor: Colors.white,
        child: InkWell(
            onTap: () {
              getImage(source: ImageSource.camera);
              _updatePosition();
            },
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 50,
              color: Colors.green,
            )),
      );

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  Widget buildContent() => Card(
    shadowColor: Colors.green,
        color: Colors.green,
        elevation: 8.0,
        // height:22,
        // decoration: BoxDecoration(
        //   color:Colors.green,
        //          //DecorationImage
        //           //Border.all
        //           borderRadius: BorderRadius.only( bottomRight: Radius.circular(8.0),
        //           bottomLeft: Radius.circular(8.0)),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey,
        //               offset: const Offset(
        //                 5.0,
        //                 5.0,
        //               ), //Offset
        //               blurRadius: 10.0,
        //               spreadRadius: 2.0,
        //             ), //BoxShadow
        //             // BoxShadow(
        //             //   color: Colors.white,
        //             //   offset: const Offset(0.0, 0.0),
        //             //   blurRadius: 0.0,
        //             //   spreadRadius: 0.0,
        //             // ), //BoxShadow
        //           ],
        //         ),

        margin: EdgeInsets.only(top: avatarHeight / 6),
        child: Text(
          DateFormat('yyyy-MM-dd , kk:mm:ss a').format(
            DateTime.now(),
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // Row(mainAxisAlignment: MainAxisAlignment.center,

        // children: [
        //   Text(
        //     DateFormat('yyyy-MM-dd , kk:mm:ss a').format(
        //       DateTime.now(),
        //     ),
        //     textAlign: TextAlign.left,
        //     style: const TextStyle(fontWeight: FontWeight.bold),
        //   ),
        //   // SizedBox(height: 15,),
        //   // new Flexible(
        //   //   child: const TextField(
        //   //     decoration: const InputDecoration(helperText: "Enter App ID"),
        //   //     //style: Theme.of(context).textTheme.body1,
        //   //   ),
        //   // ),
        // ]
        // ),
      );

  Widget buildOffence() => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
            
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down,color: Colors.green,),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      );

  Widget buildLocation() => const Card(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Location Details if Any',
                    labelStyle: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)))),
      );
  Widget buildDescription() => const Card(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Description about Offence if Any',
                    labelStyle: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)))),
      );

  Widget buildAddress() => Card(
        margin: EdgeInsets.only(top: avatarHeight / 6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  FloatingActionButton.extended(onPressed: (){

                  //  },
                  //  label: Text('GetLocation')),
                  Text(
                    "Latitude:" + _latitude,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text("Longitude:" + _longitude,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  Text("Altitude:" + _altitude,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  const Text("Address:",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  Text(_address,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      );
      Widget buildButton() => 
      Card(
        child: FloatingActionButton.extended(onPressed: (){}, label: Text('Save Offence')),

      );
}
