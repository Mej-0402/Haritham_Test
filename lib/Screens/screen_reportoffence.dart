import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'screen_location.dart';

class ReportOffence extends StatefulWidget {
  const ReportOffence({Key? key}) : super(key: key);

  @override
  _ReportOffenceState createState() => _ReportOffenceState();
}

class _ReportOffenceState extends State<ReportOffence> {
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
    return Container(
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Offence Reporting"),
          //   flexibleSpace: Image(
          //   image: AssetImage('assets/harithamreport.png'),
          //   fit: BoxFit.cover,
          // ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (imageFile != null)
                Container(
                  width: 640,
                  height: 580,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        fit: BoxFit.cover,
                        image: FileImage(imageFile!),
                        //fit: BoxFit.fill
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: double.infinity,
                            color: Colors.black,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 50, bottom: 15),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                //mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    "Latitude :" + _latitude,
                                                    style: TextStyle(
                                                        color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 15,),
                                                  Text(
                                                    "Longitude :" + _longitude,
                                                    style: TextStyle(
                                                        color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15,),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                //mainAxisSize: MainAxisSize.max,
                                                children: [
                                            //       Text(
                                            //   "Speed" + _speed,
                                            //    style: TextStyle(
                                            //             color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),
                                            // ),  
                                            SizedBox(width: 50,),
                                            Text(
                                              "Altitude" + _altitude,
                                              style: TextStyle(
                                                        color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                                ],
                                              ),
                                            ),
                                             SizedBox(height: 15,),
                                            
                                            const Text(
                                              "Address:",
                                             style: TextStyle(
                                                        color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),
                                            ), SizedBox(height: 15,),
                                            Text(
                                              _address,
                                             style: TextStyle(
                                                        color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 80,),
                                      Container(
                                        color: Colors.black,
                                        // padding: const EdgeInsets.all(20),
                                        child: ElevatedButton.icon(
                                          onPressed: _updatePosition,
                                          icon: const Icon(Icons
                                              .location_history), //icon data for elevated button
                                          label: const Text('Get Location',
                                              style: TextStyle(
                                                  fontSize: 18)), //label text
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors
                                                  .green //elevated btton background color
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                 
                )
              else
                Container(
                  width: 640,
                  height: 380,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/harithamreport1.jpeg"),
                          fit: BoxFit.fill),
                      // color: Colors.grey,
                      //  border: Border.all(width: 8, color: Colors.black),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const Text(
                    "No image selected",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

       
           
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                getImage(source: ImageSource.camera),

                            icon: const Icon(Icons
                                .add_a_photo_sharp), //icon data for elevated button
                            label: const Text("Camera",
                                style: TextStyle(fontSize: 18)), //label text
                            style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .green //elevated btton background color
                                ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                getImage(source: ImageSource.gallery),

                            icon: const Icon(Icons
                                .crop_original_rounded), //icon data for elevated button
                            label: const Text("Gallery",
                                style: TextStyle(fontSize: 18)), //label text
                            style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .green //elevated btton background color
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(),
                    
                  ],
                ),

              ),



            ],
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}


