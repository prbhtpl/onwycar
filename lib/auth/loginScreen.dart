import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onwycar/HelperFunctions/helperfunctions.dart';
import 'package:onwycar/Screens/HomePageRelatedScreens/DuplicateHomeScreen.dart';
import 'package:onwycar/constants/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onwycar/BottomNavigationBar/BottomNavigation.dart';
import 'package:onwycar/auth/signUp.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumber=TextEditingController();
  TextEditingController password=TextEditingController();
  bool isChecked = false;
  bool visible = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.lightGreen;
  }


  Future Login() async {

     if(formKey.currentState!.validate()){
       EasyLoading.show(status: 'Loading');
       var api = Uri.parse(appConstants.BaseUrl+appConstants.Login);

       Map mapeddate = {
         "mobile":mobileNumber.text,
         "password":password.text
       };


       final response = await http.post(
         api,
         body: mapeddate,
       );
       String token='';
       var res = await json.decode(response.body);
   /*    print("hererere" + response.body);*/
       setState(() {
         token=res['token'];
         print(token);
       });

       try {
         if (response.statusCode == 200) {
           await HelperFunctions.saveuserToken(token.toString());
           EasyLoading.dismiss();
Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
           
         }else{
           EasyLoading.dismiss();
           Fluttertoast.showToast(msg: 'Incorrect Number & password ');
         }
       } catch (e) {
         print(e);
       }
     }else{
       Fluttertoast.showToast(msg: 'Fill all Fields');
     }
  }

  @override
  void initState() {
    visible = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
            children: <Widget>[
              SizedBox(
                height: 140,
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
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Visibility(visible: visible?false:true,
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (val) {
                                          return val!.length == 10
                                              ? null
                                              : "Please enter 10 digit mobile Number";
                                        },controller: mobileNumber, inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Enter your mobile number',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),
                                      TextFormField(
                                        obscureText: true,

                                        controller: password,
                                        style:
                                        TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(visible: visible,
                                child: Form(child: Column(
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
                                          hintText: 'Enter your mobile number',
                                          hintStyle: TextStyle(
                                              color: Colors.black)),
                                    ),
                                   
                                  ],
                                )),
                              ),
                              Row(children: [Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                    visible=!visible;
                                  });
                                },
                              ),Text('Login With OTP')],),
                              Visibility(visible: visible?false:true,
                                child: ButtonTheme(
                                  minWidth: 150.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 1)),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    hoverColor: Colors.green,
                                    color: Colors.white,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                Login();
                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
                                    },
                                  ),
                                ),
                              ),
                              Visibility(visible: visible,
                                child: ButtonTheme(
                                  minWidth: 150.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 1)),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    hoverColor: Colors.green,
                                    color: Colors.white,
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
                                      //  signIn();
                                      /* loginMethod();*/
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      'Login means you are agree to our Terms and Privacy Policy',
                      style:
                      GoogleFonts.patrickHand(fontSize: 15)),
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
                ],
              ),
              InkWell(onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen(

                      );
                    }));
              },
                child: Text('Create new Account',
                    style:  GoogleFonts.patrickHand(fontSize: 22,color: Colors.black)),
              ),

            ],
          )],
        ),
      ),
    );
  }
}
