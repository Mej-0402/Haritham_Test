

import 'package:flutter/material.dart';

class ScreenRegUser extends StatefulWidget {
  const ScreenRegUser({Key? key}) : super(key: key);

  @override
  _ScreenRegUserState createState() => _ScreenRegUserState();
}

class _ScreenRegUserState extends State<ScreenRegUser> {
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      )),
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
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Please enter your email';
                                          }
                                           if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                              return 'Please enter a valid Email';
                                            }
                                          return null;
                                        },
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
                            hintText: 'Mail id',
                            fillColor: Colors.white,
                            filled: true)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller : _mobile,
                       keyboardType: TextInputType.phone,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Please enter your mobile number';
                                          }
                                          if(value.length!=10){ return'Must contain 10 digits';}
                                          return null;
                                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.green,
                            ),
                            hintText: 'Mobile Number',
                            fillColor: Colors.white,
                            filled: true)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                       keyboardType: TextInputType.visiblePassword,
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: _password,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Please enter your password';
                                          }
                                           if(value.length!=8){ return'Entry must have 8 characters';}
                                          return null;
                                        },
                        obscureText: true,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Please enter confirm password';
                                          }
                                          if(value!=_password.value.text){
                                            return 'Please enter same password';
                                          }
                                          return null;
                                        },
                        obscureText: true,
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
                            hintText: 'Confirm Password',
                            fillColor: Colors.white,
                            filled: true)),
                  ),

                  Container(
                      margin: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          if(myFormKey.currentState!.validate()){
                           //RegisterUser();

                            }
                        },
                        label: const Text(
                          "SignUp",
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
                            
                            Navigator.pop(context,'/ScreenLoginUser');
                          },
                          child: const Text(
                            ' Click Here to Login',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
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
