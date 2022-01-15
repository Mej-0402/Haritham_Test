import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ReportOffence extends StatefulWidget {
  const ReportOffence({Key? key}) : super(key: key);

  @override
  State<ReportOffence> createState() => _ReportOffenceState();
}

class _ReportOffenceState extends State<ReportOffence> {
  final double coverHeight = 280;
  final double profileHeight = 120;
  File? imageFile;
  late String? imagepath;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.zero, children: [buidTop(), buildContent()]),
    );
  }

  Widget buidTop() =>
      Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
        if (imageFile != null) displayImage() else buildImage(),
        //
        //

        Positioned(top: coverHeight - profileHeight / 2, child: buildCamera())
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
        radius: profileHeight / 2,
        backgroundColor: Colors.white,
        child: InkWell(
            onTap: () {
              getImage(source: ImageSource.camera);
            },
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 50,
              color: Colors.green,
            )),

        //      child: ElevatedButton.icon(

        //                         onPressed: () =>
        //                             getImage(source: ImageSource.camera),

        //                         icon: const Icon(Icons
        //                             .add_a_photo_sharp), //icon data for elevated button
        //                         label: const Text("",
        //                             style: TextStyle(fontSize: 18)), //label text
        //                         style: ElevatedButton.styleFrom(
        //   primary: Colors.green,
        // ),
        //                       ),
      );

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  Widget buildContent() => Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 55.0, left: 10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            DateFormat('yyyy-MM-dd , kk:mm:ss a').format(
              DateTime.now(),
            ),
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
      ));
}
