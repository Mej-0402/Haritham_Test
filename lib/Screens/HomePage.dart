// import 'package:drawer_app/Accordion.dart';
import 'package:flutter/material.dart';
import 'CaseStatus.dart';
import 'MainHome.dart';
import 'MyCases.dart';
import 'Notifications.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.green,
          child: TabBar(
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
        Expanded(
          child: TabBarView(
            children: [
              MainHome(),
              MyCases(),
              CaseStatus(),
              NotificationScreen(),
            ],
          ),
        ),
      ],
    );
  }
}