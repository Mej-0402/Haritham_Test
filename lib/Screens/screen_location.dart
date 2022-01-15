import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocCap extends StatefulWidget {
  const LocCap({ Key? key }) : super(key: key);


  @override
  _LocCapState createState() => _LocCapState();
}

class _LocCapState extends State<LocCap> {

  var _latitude ="";
    var _longitude ="";
      var _altitude ="";
        var _speed ="";
          var _address ="";

          Future<void> _updatePosition() async{
            Position pos =await _determinePosition();
            List pm = await placemarkFromCoordinates(pos.latitude,pos.longitude);
            setState(() {
              _latitude =pos.latitude.toString();
              _longitude= pos.longitude.toString();
              _altitude=pos.altitude.toString();
              _speed=pos.speed.toString();
              _address  = pm[0].toString();
            });
          }
          Future<Position> _determinePosition() async {
            bool serviceEnabled;
            LocationPermission permission;
            serviceEnabled = await Geolocator.isLocationServiceEnabled();
            if(!serviceEnabled){
              return Future.error("Location Services are disabled");

            }
            permission =await Geolocator.checkPermission();
            if (permission == LocationPermission.denied){
              permission =await Geolocator.requestPermission();
              if(permission== LocationPermission.denied)
              {
                return Future.error("Location Permision are denied");
              }
              
            }
            if (permission == LocationPermission.deniedForever ){
              return Future.error("Location Permissions are permanently denied ,we cannot request permission");
            }
                          return await Geolocator.getCurrentPosition();


          }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOCATION CAPTURING"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("your last known Location is:"),
            Text("latitude :" + _latitude,style:TextStyle(color: Colors.orange),),
            Text("Longitude" + _longitude),
            Text("Altitude"+ _altitude),
            Text("Speed" + _speed),
            Text("Address:"),
            Text(_address)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _updatePosition,
      tooltip: 'get GPS Position',
      child: const Icon(Icons.change_circle_outlined),),
      
    );
  }
}