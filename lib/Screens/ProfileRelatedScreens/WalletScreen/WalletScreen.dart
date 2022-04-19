import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Money'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff73c803),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.wallet),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add Money in Your Wallet',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        'TopUp your wallet',
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: '₹ 50',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      Divider(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffDEF1F8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ ₹ 10'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffDEF1F8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ ₹ 100'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffDEF1F8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ ₹ 200'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffDEF1F8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ ₹ 300'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffDEF1F8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blue)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('+ ₹ 500'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/discount.png',
                            scale: 6,
                          ),

                          ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.black),
                            onPressed: () {},
                            child: Text('Apply Coupan'),
                          )
                        ],
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('Add Money',style: TextStyle(fontSize: 18),)),
SizedBox(height: 40,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Available Balance',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '₹ 30',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Status',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/cash.png',
                    scale: 1.5,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
