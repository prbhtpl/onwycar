import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onwycar/Screens/ProfileRelatedScreens/AcoountScreens/accountScreen.dart';
import 'package:onwycar/Screens/ProfileRelatedScreens/Mybookings/myBoookings.dart';
import 'package:onwycar/Screens/ProfileRelatedScreens/ProfileVerification/profileVerification.dart';
import 'package:onwycar/Screens/ProfileRelatedScreens/TransactionHistory/TransactionHistory.dart';
import 'package:onwycar/Screens/ProfileRelatedScreens/WalletScreen/WalletScreen.dart';
import 'package:onwycar/auth/loginScreen.dart';

import 'CoDriver/COdriverInformationScreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color grey=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(foregroundColor: Colors.black,elevation: 0.5,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(FontAwesomeIcons.accusoft),SizedBox(width: 10,),
          Text(
            'Onway Car',
            style: GoogleFonts.lobster(fontSize: 25),
          ),
        ],
      ),
    ),drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 50,
                      child: Image(
                        image: NetworkImage(
                            'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png'),
                      ),
                    ),
                  )),
              Text('Name', style: TextStyle(fontSize: 20)),
              Text(
                '7777777777',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                ' prbhtpl.pp@gmail.com ',
                style: TextStyle(color: Colors.grey),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 8.0, left: 8.0, bottom: 5),
                child: InkWell(
                  onTap: () {
                  /*  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => manageAddress()));*/
                  },
                  child: Column(

                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text('Profile Document'),Icon(CupertinoIcons.clear_circled_solid,color: Colors.red,),],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mobile Number'),  Icon(CupertinoIcons.check_mark_circled_solid,color: Colors.lightGreen,),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Wallet '), Icon(CupertinoIcons.clear_circled_solid,color: Colors.red,),
                        ],
                      ),
                SizedBox(width: 10,),


                    ],
                  ),
                ),
              ),



              Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletScreen()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.wallet,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Wallet')
                        ],
                      ),
                      Row(
                        children: [Text('₹50',style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold))],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyBookings()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.ideal,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('My Booking')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => transactionHisory()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.ideal,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          const Text('Transaction History')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),

              InkWell(onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountScreen()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.accusoft,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Account')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileVerification()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.print,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Profile Verification')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CoDriverInformation()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.redRiver,color: Colors.grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Co- Driver')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ), Divider(
                thickness: 2,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.exit_to_app,color: grey,),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Log Out')
                        ],
                      ),
                      Row(
                        children: [Icon(Icons.arrow_forward_ios_rounded)],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
