import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'screen_reportoffence.dart';
import 'screen_signup.dart';

class ScreenMainHome extends StatefulWidget {
  const ScreenMainHome({Key? key}) : super(key: key);

  @override
  _ScreenMainHomeState createState() => _ScreenMainHomeState();
}

class _ScreenMainHomeState extends State<ScreenMainHome> {
  final screens = [];

  int index = 1;
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "Haritha Keralam",
              style: TextStyle(
                  // color: Colors.green,
                  ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    //color: Colors.green,
                  ),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(
                    Icons.work_rounded,
                    //  color: Colors.green,
                  ),
                  text: "My Cases",
                ),
                Tab(
                  icon: Icon(
                    Icons.task_rounded,
                    //  color: Colors.green,
                  ),
                  text: "Case Status",
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications_rounded,
                    //  color: Colors.green,
                  ),
                  text: "Notifications",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPage('Home Page'),
              buildPage('My Cases Page'),
              buildPage('Case Status  Page'),
              buildPage('Notifications Page'),
            ],
          ),
         // screens[index],
          
          bottomNavigationBar: CurvedNavigationBar(
           // index: index,
//height: 65.0,
            color: Colors.green,
            backgroundColor: Colors.white,
            items: <Widget>[
              Icon(
                Icons.lock_sharp,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.camera_alt_rounded,
                size: 45,
                color: Colors.white,
                
              ),
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ],
            // onTap: (index) =>
            // setState(() => this.index = index),
            onTap:(index){
              setState(() {
                index = index;
              });
            } ,
          ),
        ),
      );
  Widget buildPage(String text) => Center(
        child: Text(text),
      );
}
