import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:haritham_sample/Screens/screen_login.dart';
import 'package:haritham_sample/Screens/screen_reportoffence.dart';

class ScreenBottomNav extends StatefulWidget {
  const ScreenBottomNav({ Key? key }) : super(key: key);

  @override
  _ScreenBottomNavState createState() => _ScreenBottomNavState();
}

class _ScreenBottomNavState extends State<ScreenBottomNav> {
  GlobalKey<CurvedNavigationBarState> _NavKey =  GlobalKey();
  var screen =[MyHome(),ReportOffence()];
  var myindex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.white,
          items: [
          Icon(Icons.lock_sharp,color: Colors.white,),
           Icon(Icons.camera_alt_rounded,color: Colors.white,),
            //Icon(Icons.home),

        ],
onTap: (index){
  setState(() {
    myindex =index;
    
  });
},
      ),
      body: screen[myindex],
     

    );
  }
}
// bottomNavigationBar: 
        // BottomNavigationBar(
        //   elevation: 0.0,
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white,
        //   backgroundColor: Colors.green,
        //   currentIndex: _selectedIndex,
        //   onTap: (value) {
        //     setState(() {
        //       _selectedIndex = value;
        //     });
        //   },
        //   items: const [
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //         ),
        //         label: 'home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.camera_alt_rounded,
        //           size: 50.0,
        //         ),
        //         label: 'Report An Offence'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.logout_rounded ),label: 'Logout'),
        //   ],
        // ),