import 'package:flutter/material.dart';
import 'Screens/screen_login.dart';
import 'Screens/screen_signup.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        '/ScreenRegUser':(context) =>const ScreenRegUser(),
        
      },
home: const MyHome(
  
),      
    );
  }
}
