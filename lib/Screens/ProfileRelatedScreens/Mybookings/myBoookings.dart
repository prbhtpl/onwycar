

import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0.5,
      title: Text('Booking History'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    body:SingleChildScrollView(
      child: Column(
        children: [
          booking()
        ],
      ),
    ),);
  }
  Widget booking(){
    return  ListView.builder(itemCount: 4,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (BuildContext,int index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            IntrinsicHeight (
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 120,width: 120,child: Image.asset('assets/car.jpg'),),
VerticalDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
                      Text('Up 32 JR 1205'),
                      Text('2018'),
                      Text('Fuel: Petrol'),
                      Text('Driver: No(120.0Km,5hrs'),
                    ],),
                  )
                ],
              ),
            ),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Status'),
                TextButton(onPressed: (){}, child: Text('Cancel',style: TextStyle(color: Colors.red),))
              ],
            ),
            SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Status'),
                Text('419')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Status'),
                Text('Wallet')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Status'),
                Text('Paid',style: TextStyle(color: Colors.green)),
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TranscationId'),
                Text('07TEWGO_')
              ],
            ),  SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start Meter Reading'),
                Text('0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('End Meter reading'),
                Text('0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Security Money'),
                Text('₹ 180.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rent Price'),
                Text('₹ 80.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Price '),
                Text('₹ 180.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vehical Extension '),
                Text('₹ 15.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax'),
                Text('₹ 15.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount'),
                Text('₹ 15.0')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price'),
                Text('₹ 15.0',style: TextStyle(color: Colors.lightGreen),)
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pickup Date and Time'),
                Text('2020-07-12 18:50:00')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Drop Date and Time'),
                Text('2020-07-12 18:50:00')
              ],
            ), SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Date and Time'),
                Text('2020-07-12 18:50:00')
              ],
            ),
            Divider(thickness: 3,),
          ],
        ),
      );
    });
  }
}
