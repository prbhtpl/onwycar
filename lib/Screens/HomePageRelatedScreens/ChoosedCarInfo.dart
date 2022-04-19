import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onwycar/Screens/HomePageRelatedScreens/AvailableCars.dart';



class ChoosedCarInfo extends StatefulWidget {
  const ChoosedCarInfo({Key? key}) : super(key: key);

  @override
  State<ChoosedCarInfo> createState() => _ChoosedCarInfoState();
}

class _ChoosedCarInfoState extends State<ChoosedCarInfo> {
  String locality = '';
  String filledAddress = '';
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong() async {
    Position position = await _getGeoLocationPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];

    setState(() {
      locality =
          '${place.street}, ${place.subLocality}, ${place.locality},\n ${place.postalCode}, ${place.country}';
      /* LoginActivity();*/
      filledAddress= ' ${place.subLocality}, ${place.locality}  ';
    });
    print(
        '${place.name} ${place.subAdministrativeArea} ${place.locality} ${place.subLocality}');
  }

  bool isChecked = false;
  @override
  void initState() {
    _getGeoLocationPosition();
    GetAddressFromLatLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /*Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CarDetails()));*/
        return true;
      },
      child: Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,floatingActionButton:    Column(
      mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
/*                Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut()));*/
              },
              child: Text('Pay ₹1200'),
            ),
          ),SizedBox(height: 60,)
        ],
      ),
          appBar: AppBar(foregroundColor:Colors.black ,
            backgroundColor: Colors.white,elevation: 0.5,
            title: Text(
              'Onway Car',
              style: GoogleFonts.lobster(fontSize: 25),
            ),centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/car.jpg', scale: 3),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tata Tiago',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.square_stack_3d_down_right_fill,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Automatic'),
                          Icon(
                            CupertinoIcons.bag_fill,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Electric')
                        ],
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '25-March-2022 11:48 AM ',
                            style: TextStyle(fontSize: 10),
                          ),
                          Icon(Icons.more_horiz),
                          Icon(
                            CupertinoIcons.car_detailed,
                            size: 18,
                          ),
                          Icon(Icons.more_horiz),
                          Text(
                            ' 30-March-2022 11:48 AM',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery and Pick Up At : ',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                                print(isChecked);
                              });
                            },
                          ),
                          Text('₹ 99',
                              style: TextStyle(
                                fontSize: 18,
                              ))
                        ],
                      ),
                      Text('( Extra Charges )',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      Visibility(
                          visible: isChecked,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(locality),
                                    TextButton(
                                      onPressed: () {
                                        SelectAddress();
                                      },
                                      child: Text('Select'),
                                      style: TextButton.styleFrom(
                                          primary: Colors.green),
                                    )
                                  ],
                                )),
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/discount.png',
                            scale: 6,
                          ),
                          Text('Rs: 0.00 OFF ',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.black),
                            onPressed: () {},
                            child: Text('Check Offer Now'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Bill Summary',style: TextStyle(fontSize: 12),),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DottedLine(direction: Axis.horizontal,lineThickness: 0.5,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Refundable Deposit: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('₹ 1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Free Km: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('₹ 1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trip Fare: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('₹ 1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Offer Amount: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('- ₹1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Damage Protection Fee: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('₹ 1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Payable Amount: ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          Text('₹ 1200',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),


                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  void SelectAddress() {
    showModalBottomSheet(isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (BuildContext context, State) {
                  return Container(
                  margin:  MediaQuery.of(context).viewInsets,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Divider(
                            thickness: 5,
                            indent: 160,
                            endIndent: 160,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Add New Delivery Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Container(  decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                              child: TextFormField(decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.zero,
                                hintText: "Landmark / Block / Building"
                              ),),
                            ),
                          ),

                          Padding(
                            padding: const  EdgeInsets.symmetric(horizontal: 18.0),
                            child: Container( height: 40, decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                              child: Center(child: Text(filledAddress)),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xff73c803)),onPressed: (){
                              Navigator.pop(context);
                            },child: Text('Save Address'),),
                          )
                     ,  SizedBox(height: 40,)
                        ],
                      ),
                    ),
                  );
                });
              });
        });
  }
}
