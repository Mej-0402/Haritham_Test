import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _UserId = TextEditingController();
  final _Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: const BoxDecoration(
        
          image: DecorationImage(
              image: AssetImage("assets/images/harithamLogin1.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child:const Text("SignIn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),)),
                  Container(
                    width: double.infinity,
                    //height: 350.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/harithamLogin2.jpg'),
                                radius: 100,
                          )
                        ],
                      ),
                    ),
                    // decoration:const BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //   image: DecorationImage(image: AssetImage("assets/images/harithamLogin2.jpg"),fit: BoxFit.cover)
                    // ),
                  ),

                  // const Text(
                  //   "Login Here",
                  // ),
                  // Image.asset("assets/images/harithamLogin.jpg"),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            hintText: 'UserName',
                            fillColor: Colors.white,
                            filled: true)),
                  ),
 Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            prefixIcon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.green,
                            ),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true)),
                  ),
                  Container(
                      margin: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                                                       Navigator.pushNamed(context,'/ScreenReportOffence');

                        },
                        label: Text(
                          "SignIn",
                          style: TextStyle(color: Colors.green),
                        ),
                        backgroundColor: Colors.white,
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          onPressed: () {
                             Navigator.pushNamed(context,'/ScreenRegUser');
                          },
                          child: Text(
                            'Create an Account',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(width: 25),
// ,                        FloatingActionButton.extended(
//                           backgroundColor: Colors.white,
//                             onPressed: () {}, label: Text("SignUp",style: TextStyle(color: Colors.green),))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
