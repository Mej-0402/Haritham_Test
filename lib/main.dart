import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'Screens/screen_location.dart';
// import 'Screens/screen_bottomnav.dart';
// import 'Screens/home.dart';
// import 'Screens/screen_login.dart';
// import 'Screens/screen_mainhome.dart';
// import 'Screens/screen_reportoffence.dart';
// import 'Screens/screen_signup.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/ScreenRegUser': (context) => const ScreenRegUser(),

        // '/ScreenReportOffence': (context) => const ReportOffence(),
        // '/ScreenDatapi': (context) => const ReportOffence(),
        // '/ScreenMainHome': (context) => const ScreenMainHome(),
        // '/ScreenBottomNav': (context) => const ScreenBottomNav(),
        //'/ScreenLocation':(context) =>const LocationCapture(),
        //'/TestDemo':(context) =>const TestDemo(),
      },
       theme: ThemeData(
        primarySwatch: Colors.green,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.green
        ),
      ),
      home: const ScreenHome(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/harithamSplash1.jpg', height: 100.0),
        SizedBox(
          height: 30.0,
        ),
        // SpinKitRipple(color:Colors.red)
      ],
    );
  }
}
