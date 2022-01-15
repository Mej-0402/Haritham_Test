import 'package:flutter/material.dart';



import 'HomePage.dart';
import 'ReportOffence.dart';

 import 'LogOut.dart';
// import 'ReportOffence.dart';


class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var _selectedIndex = 0;
  final _pagelist = [HomePage(), ReportOffence(), LogOutScreen()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.green,
        elevation: 0.0,
 
         //shadowColor: Colors.green,
            title: const Text(
              "Haritha Keralam",
              style: TextStyle(
                  // color: Colors.green,
                  ),
            ),
            
            ),
        drawer: Drawer(
        //  backgroundColor: Colors.green[100],
            child: ListView(
          children: [
            Container(
              height: 200,
              child: const DrawerHeader(
                  decoration: BoxDecoration(
                     image: DecorationImage(
          image: AssetImage(
              'assets/images/harithamLogin.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
       // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    
                    color: Colors.grey,
                  ),
                  child: Center(child: Text('')
                  
                  )
                  ),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.green[900],),
              title: Text('Settings',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
              subtitle: Text('Various Settings',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Icon(Icons.info ,color: Colors.green[900],),
              title: Text('About',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
              subtitle: Text('About Haritha Keralam Mission',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
            ),
            // ListTile(
            //   leading: Icon(Icons.public,color: Colors.green[900],),
            //   title: Text('Public',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
            //   subtitle: Text('Public Login',style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
            // ),
          ],
        )),
        body: _pagelist[_selectedIndex],
        bottomNavigationBar: 
        BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.green,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 50.0,
                ),
                label: 'Report An Offence'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded ),label: 'Logout'),
          ],
        ),
      ),
    );
  }
}