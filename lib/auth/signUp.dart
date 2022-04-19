import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onwycar/auth/OtpScreen.dart';
import 'package:onwycar/constants/appConstants.dart';
import 'loginScreen.dart';
import 'package:http/http.dart' as http;
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
TextEditingController email=TextEditingController();
TextEditingController name=TextEditingController();
TextEditingController mobileNumber=TextEditingController();
TextEditingController password=TextEditingController();
final formKey = GlobalKey<FormState>();
  Future Register() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading');
    var api = Uri.parse(appConstants.BaseUrl+appConstants.Register);

    Map mapeddate = {"name":name.text,
      "email":email.text,
      "mobile":mobileNumber.text,
      "password":password.text};


    final response = await http.post(
      api,
      body: mapeddate,
    );
String msg='';
    var res = await json.decode(response.body);
  /*  print("hererere" + response.body);*/
    setState(() {
msg=res['status_message'];
    });

    try {
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        if(msg=='"User Register Successful'){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));}
      else if(msg=='Email Id is already exists'){
        Fluttertoast.showToast(msg: msg.toString());
        }else if(msg=='Contact Number is already exists'){
          Fluttertoast.showToast(msg: msg.toString());
        }else{
          Fluttertoast.showToast(msg: 'Something Went Wrong');
        }
      }else{
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: 'Something Went Wrong');
      }
    } catch (e) {
      print(e);
    }}else{
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: 'Fill all fields');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(controller: name,
                                        keyboardType:
                                        TextInputType.emailAddress,


                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Enter your name',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),
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
                                           controller: email,
                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Enter your email',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),
                                      TextFormField(validator: (val) {
                                        return val!.length == 10
                                            ? null
                                            : "Please enter 10 digit mobileNumber";
                                      },controller: mobileNumber,
                                        obscureText: true,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        /* controller: password,*/
                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Enter your mobile number',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),
                                      TextFormField(controller: password,
                                        obscureText: true,


                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Create Password',
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
                                          color: Colors.teal, width: 1)),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    hoverColor: Colors.green,
                                    color: Colors.white,
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                 Register();
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
                      height: 30,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.white,
                                indent: 30,
                                height: 36,
                              )),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: Colors.black),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                  height: 36,
                                  endIndent: 30)),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return LoginScreen(

                                );
                              }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text('Login?',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold)),
                        ))
                  ],
                ),


              ],
            )],
        ),
      ),
    );
  }
}
