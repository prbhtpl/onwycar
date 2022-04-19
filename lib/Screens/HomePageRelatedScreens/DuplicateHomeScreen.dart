import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:onwycar/HelperFunctions/helperfunctions.dart';
import 'package:onwycar/constants/appConstants.dart';
import 'home.dart';

class DuplicateHome extends StatefulWidget {
  const DuplicateHome({Key? key}) : super(key: key);

  @override
  State<DuplicateHome> createState() => _DuplicateHomeState();
}

class _DuplicateHomeState extends State<DuplicateHome> {
  String token = '';
  String? CityID;
  List data = [];
  String? _mySelection;
  Future CitiesList() async {
    token = (await HelperFunctions.getuserToken())!;
    print("asd" + token.toString());
    var api = Uri.parse(appConstants.BaseUrl + appConstants.CityGet);

    Map mapeddate = {};

    final response = await http.get(api, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var res = await json.decode(response.body);
    print("hererere" + response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = res['response_getcity'];
      });
    }
  }

  @override
  void initState() {
    CitiesList();
    super.initState();
  }

  // entire logic is inside this listener for ListView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              FontAwesomeIcons.accusoft,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Onway Car',
              style: GoogleFonts.lobster(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSlider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Select Your City',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black54, width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  border: Border.all(width: 0.5)),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['city_name']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _mySelection = newVal as String?;
                                      CityID = newVal;
                                      print(CityID);
                                    });
                                  },
                                  value: _mySelection,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border:
                                      Border.all(color: Colors.black, width: 1)),
                              height: 40,
                              child: TextButton(
                                onPressed: () {if(_mySelection==null){
                                  Fluttertoast.showToast(msg: 'Choose Your City First');
                                }else{

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(
                                            CityId: CityID.toString(),
                                          )));
                                }
                                },
                                child: Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Services',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/3.jpg',
                        height: 115,
                        width: 170,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/3.jpg',
                        height: 115,
                        width: 170,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                BannerSlider()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgList[4]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgList[3]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgList[2]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgList[1]),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imgList[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 140.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
