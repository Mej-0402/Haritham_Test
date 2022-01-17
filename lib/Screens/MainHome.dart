import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(

      
        


        
//        child: Stack(
//   children: [
    
//     Container(
//       margin: EdgeInsets.only(top: 48),
//     height: 300,decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(16.0),
// ),),
//     Align(
//       alignment: Alignment.topCenter,
//     child: SizedBox(
//     child: CircleAvatar(
//       radius: 40.0,
//       backgroundColor: Colors.white,
//       child: CircleAvatar(
//         child: Align(
//           alignment: Alignment.bottomRight,
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 12.0,
//             child: Icon(
//               Icons.camera_alt,
//               size: 15.0,
//               color: Color(0xFF404040),
//             ),
//           ),
//         ),
//         radius: 38.0,
//         // backgroundImage: AssetImage(
//         //   'assets/images/user-image-default.png'),
//       ),
//     ),)
//   ),
//   ]
// )
        
        //   child: Container(

        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: Colors.green,
        //                 borderRadius: BorderRadius.circular(20),
        //               ),
        //               child: TextField(
        //                 decoration:InputDecoration(enabledBorder: InputBorder.none,
        //                 focusedBorder: InputBorder.none,
        //                 icon:Icon(Icons.search)),
        //               ),
        //             ),

        //           ],

        //         )
        //       ],
        //     )
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //    // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       Row(
        //         children: [
        //           Container(
        //             decoration: BoxDecoration(
        //              //color: Colors.white,
        //               border: Border.all(color: Colors.green, width: 2.0),
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: const TextField(
        //               decoration: InputDecoration(
        //                   enabledBorder: InputBorder.none,
        //                   focusedBorder: InputBorder.none,
        //                   hintText: "search",
        //                   hintStyle: TextStyle(fontSize: 17.0),
        //                   icon: Padding(
        //                     padding: EdgeInsets.all(20.0),
        //                     child: Icon(
        //                       Icons.search,
        //                       color: Colors.green,
        //                     ),
        //                   )),
        //             ),
        //           ),
        //         ],
        //       ),
        //       Divider(
        //         thickness: 2.0,
        //         height: 50,
        //       ),
        //       Container(
        //         //alignment: Alignment.center,
        //         child: buildAnimatedText('The vision, mission and motto of Haritha Keralam Mission'),
                
        //       ),
        //       Divider(
        //         thickness: 2.0,
        //         height: 50,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(96.0),
        //         child: 
        //         Row()
        //         // Container(
        //         //   width: 100,
        //         //   height: 100,
        //         //   decoration:
        //         //       BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        //         // ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(122.0),
        //         child: Container(
        //           width: 50,
        //           height: 50,
        //           decoration: BoxDecoration(
        //               color: Colors.amber, shape: BoxShape.circle),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(134.0),
        //         child: Container(
        //           width: 25,
        //           height: 25,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[600], shape: BoxShape.circle),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        //),
      ),
    );
  }
  Widget buildAnimatedText(String text) => Marquee(
  text:text,
  blankSpace:10.0
);
}

