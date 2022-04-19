// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileVerification extends StatefulWidget {
  const ProfileVerification({Key? key}) : super(key: key);

  @override
  State<ProfileVerification> createState() => _ProfileVerificationState();
}

class _ProfileVerificationState extends State<ProfileVerification> {
  final picker = ImagePicker();
  File? frontDrivingLicense;
  File? backDrivingLicense;
  File? frontAadharCard;
  File? backAadharCard;
  Future frontDrivingLicense1(context, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        frontDrivingLicense = new File(pickedFile.path);
        print(frontDrivingLicense!.path);
      });
    }
  }
  Future backDrivingLicense2(context, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        backDrivingLicense = new File(pickedFile.path);
        print(backDrivingLicense!.path);
      });
    }
  }
  Future frontAadharCard1(context, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        frontAadharCard = new File(pickedFile.path);
        print(frontAadharCard!.path);
      });
    }
  }
  Future backAadharCard2(context, ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        backAadharCard = new File(pickedFile.path);
        print(backAadharCard!.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton:FloatingButton(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('PROFILE VERIFICATION'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'only few steps left to complete. Upload remaining documents to continue using On Way Car',
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black54),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    'VERIFY PROFILE IN 2 SIMPLE STEPS',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Upload Driving License',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black54))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print('love');
                  frontDrivingLicense1(context, ImageSource.camera);
                },
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade50, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: frontDrivingLicense == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.add_circled,

                        ),
                        Text(
                          'Upload front picture of driving license',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )
                      : Image.file(frontDrivingLicense!, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print('love');
               backDrivingLicense2(context, ImageSource.camera);
                },
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade50, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: backDrivingLicense == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.add_circled,

                        ),
                        Text(
                          'Upload back picture of driving license',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )
                      : Image.file(backDrivingLicense!, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('2',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black54)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Upload Addhar Card',
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black54))
                ],
              ), SizedBox(
                height: 10,
              ), InkWell(
                onTap: () {
                  print('love');
               frontAadharCard1(context, ImageSource.camera);
                },
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade50, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: frontAadharCard == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.add_circled,

                        ),
                        const Text(
                          'Upload front picture of Aadhaar Card',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )
                      : Image.file(frontAadharCard!, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print('love');
                 backAadharCard2(context, ImageSource.camera);
                },
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade50, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: backAadharCard == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.add_circled,

                        ),
                        Text(
                          'Upload back picture of  Aadhaar Card',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )
                      : Image.file(backAadharCard!, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(
                height: 10,
              ),
SizedBox(height: 150,)

            ],
          ),
        ),
      ),
    );
  }
  Widget FloatingButton(){
    return  Container(height:160,
      decoration: BoxDecoration(border: Border.all(color: Colors.black54,width: 0.5),color: Colors.white70,borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      child: Column(mainAxisAlignment:MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [   Divider(thickness: 1),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('By Continuing, you are agree to applicable '),
              InkWell(child: Text("T&Cs",style: TextStyle(decoration: TextDecoration.underline,color: Colors.lightGreen),))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
            child: ElevatedButton( onPressed: (){}, child:Text('Verify Profile Now'),style: ElevatedButton.styleFrom(primary: Colors.lightGreen),),
          )
          ,SizedBox(height: 50,)
        ],
      ),
    );
  }
}
