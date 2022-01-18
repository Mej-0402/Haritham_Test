//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';

class CardItem {
  final String img;
  final String title;

  const CardItem({required this.img, required this.title});
}

class CardItemBottom {
  final String pic;
  final String title;
  final String Descripton;

  const CardItemBottom(
      {required this.pic, required this.title, required this.Descripton});
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<CardItemBottom> item = [
    const CardItemBottom(
      pic: 'assets/images/harithamBurning.jpg',
      title: 'Major Offence Type1',
      Descripton:
          'DETAILED DESCRIPTION ON OFFENCE TYPE 1', // img: Image.asset('assets/images/harithamLogin2.jpg',height: 150,),
      // title:'Recently Reported Offence 1'
    ),
    const CardItemBottom(
      pic: 'assets/images/harithamWaste.jpg',
      title: 'Major Offence Type2',
      Descripton:
          'DETAILED DESCRIPTION ON OFFENCE TYPE 2', // img: Image.asset('assets/images/harithamLogin2.jpg',height: 150,),
      // title:'Recently Reported Offence 1'
    ),
  ];
  List<CardItem> items = [
    const CardItem(
        img: 'assets/images/harithamwaste1.jpg',
        title:
            'Recently Reported Offence 1' // img: Image.asset('assets/images/harithamLogin2.jpg',height: 150,),
        // title:'Recently Reported Offence 1'
        ),
    const CardItem(
      img: 'assets/images/harithamBurning.jpg',
      title: 'Recently Reported Offence 2',
    ),
    const CardItem(
      img: 'assets/images/harithamWaste.jpg',
      title: 'Recently Reported Offence 3',
    ),
    const CardItem(
      img: 'assets/images/harithamwaste2.jpg',
      title: 'Recently Reported Offence 4',
    ),
    const CardItem(
        img: 'assets/images/harithamWaste.jpg',
        title: 'Recently Reported Offence 5'),
    const CardItem(
      img: 'assets/images/harithamBurning.jpg',
      title: 'Recently Reported Offence 6',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
      //  buidTopMain(),
        const Divider(
          thickness: 2.0,
        ),
        buildTopContentMain(),
        buildContentMain(),
        const Divider(
          thickness: 2.0,
        ),
        buildHeadBottom(),
        buildContentBottom(),
      ]),
    );
  }

  // Widget buidTopMain() => Container(
  //       height: 50.0,

  //       // child: Row(
  //       //   children: [
  //       //     Marquee(
  //       //       text: "Haritham Scrolliing Text",
  //       //       style: TextStyle(
  //       //           fontSize: 16,
  //       //           color: Colors.green,
  //       //           fontWeight: FontWeight.bold),
  //       //       blankSpace: 10.0,
  //       //       scrollAxis: Axis.horizontal,
  //       //     crossAxisAlignment: CrossAxisAlignment.start,

  //       //     ),
  //       //   ],
  //       // ),
  //       child: Padding(
  //           padding: EdgeInsets.all(8.0),
  //           child: TextField(
  //               decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   labelText: 'Haritham Scrolling Text',
  //                   labelStyle: TextStyle(
  //                       color: Colors.green, fontWeight: FontWeight.bold)))),
  //     );
  Widget buildTopContentMain() => Row(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Recently Reported Cases',
            style: TextStyle(
                fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        )
      ]);
  Widget buildContentMain() => Container(
        height: 290,
        child: ListView.separated(
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(width: 8.0),
          itemBuilder: (context, index) => buildCard(item: items[index]),

          //     children: [
          //       buildCard(),
          //       SizedBox(width: 12,),
          //       buildCard(),
          // SizedBox(width: 12,),
          //   buildCard(),
          //    SizedBox(width: 12,),
          //   buildCard(),
          //    SizedBox(width: 12,),
          //   buildCard(),

          //     ],
          // child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: TextField(
          //         decoration: InputDecoration(
          //             border: InputBorder.none,
          //             labelText: 'Description about Offence if Any',
          //             labelStyle: TextStyle(
          //                 color: Colors.green, fontWeight: FontWeight.bold)))),
        ),
      );
  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 300,
        //  shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15.0),),
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      
                      child: InkWell(
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.cover,
                        ),
                        onTap: (){
                           Navigator.pushNamed(context,'/RecentOffenceDetailPage');
                        },
                      ),
                    ))),
            Text(item.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );
  Widget buildHeadBottom() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Major Offence Types in Haritha Keralam",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );
  Widget buildContentBottom() => Container(
        height: 290,
        child: ListView.separated(
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          separatorBuilder: (context, _) => SizedBox(height: 30.0),
          itemBuilder: (context, index) => buildCardBottom(item: item[index]),
        ),
      );
  Widget buildCardBottom({
    required CardItemBottom item,
  }) =>
      Container(
        width: 300,
        //  shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15.0),),
        child: Column(
          children: [
            Text(item.title,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item.pic,
                      fit: BoxFit.cover,
                    ))),
            Text(item.Descripton,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );

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

//   Widget buildAnimatedText(String text) => Marquee(
//   text:text,
//   blankSpace:10.0
// );
}
