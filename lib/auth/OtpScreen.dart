import 'package:flutter/material.dart';

import 'package:onwycar/Screens/HomePageRelatedScreens/DuplicateHomeScreen.dart';
import 'package:timer_count_down/timer_count_down.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'On Way Car',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20)),
                          border:
                          Border.all(color: Colors.black, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.black12,
                          width: 300,
                          height: 170,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Form(
                                  /*key: formKey,*/
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (val) {
                                          return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(val!)
                                              ? null
                                              : "Please provide a valid email";
                                        },
                                        /*   controller: email,*/
                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Enter Otp',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),



                                    ],
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 150.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 0.5)),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    hoverColor: Colors.green,
                                    color: Colors.white,
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DuplicateHome()));
                                      //  signIn();
                                      /* loginMethod();*/
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: Text('Resend Otp : ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),),

                      Countdown(
                      seconds: 20,
                      build: (BuildContext context, double time) => Text(time.toString(),style: TextStyle(color: Colors.red),),
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        print('Timer is done!');
                      },
                    )

                      ],
                    ),

                  ],
                ),


              ],
            )],
        ),
      ),
    );
  }
}
