import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportOffence extends StatefulWidget {
  const ReportOffence({Key? key}) : super(key: key);

  @override
  _ReportOffenceState createState() => _ReportOffenceState();
}

class _ReportOffenceState extends State<ReportOffence> {
  File? imageFile;
  late String? imagepath;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/images/harithamreport1.jpeg"),
      //         fit: BoxFit.fill)),
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageFile != null)
                  Container(
                    width: 640,
                    height: 380,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //  color: Colors.grey,
                        image: DecorationImage(
                          image: FileImage(imageFile!),
                          fit: BoxFit.fill
                        ),
                        //border: Border.all(width: 8, color: Colors.black),
                        borderRadius: BorderRadius.circular(12.0)),
                  )
                else
                  Container(
                    width: 640,
                    height: 380,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
              image: AssetImage("assets/images/harithamreport1.jpeg"),
              fit: BoxFit.fill),
                        // color: Colors.grey,
                        //  border: Border.all(width: 8, color: Colors.black),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Text(
                      "No image selected",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                      onPressed: () => getImage(source: ImageSource.camera),

                        icon: Icon(Icons.add_a_photo_sharp), //icon data for elevated button
                        label: Text("Camera", style: TextStyle(fontSize: 18)), //label text
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
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                      onPressed: () => getImage(source: ImageSource.gallery),

                        icon: Icon(Icons.crop_original_rounded ), //icon data for elevated button
                        label: Text("Gallery", style: TextStyle(fontSize: 18)), //label text
                        style: ElevatedButton.styleFrom(
                            primary: Colors
                                .green //elevated btton background color
                            ),
                      ),
                    ),
                    // Container(
                    //     child: ElevatedButton(
                    //   onPressed: () => getImage(source: ImageSource.camera),
                    //   style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all<Color>(Colors.green),
                    //   ),
                    //   child:
                    //       const Text('Camera', style: TextStyle(fontSize: 18)),
                    // )),
                    
                    // Container(
                    //     child: ElevatedButton(
                    //   onPressed: () => getImage(source: ImageSource.gallery),
                    //   style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all<Color>(Colors.green),
                    //   ),
                    //   child:
                    //       const Text("Gallery", style: TextStyle(fontSize: 18)),
                    // )),
                  ],
                ),
              ],
            ),
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
