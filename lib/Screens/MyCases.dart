import 'package:flutter/material.dart';

class MyCases extends StatelessWidget {
  const MyCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Text("Cases Reportd By Me"),
      )
      // GridView.count(
      //   crossAxisCount: 4,
      //   children: List.generate(100, (index) {
      //     return Center(
      //       child: Card(
      //         child: Text('item $index'),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}