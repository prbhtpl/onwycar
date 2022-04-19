import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[Colors.blue, Colors.green, Colors.green]))),
          title: TabBar(
            labelPadding: EdgeInsets.only(left: 80, right: 80),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4,
                  color: Colors.white,
                ),
                insets: EdgeInsets.only(left: 0, right: 8, bottom: 4)),
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Cars',
              ),
              Tab(
                text: 'PEDL',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Car(),
            Pedl(),
          ],
        ),
      ),
    );
  }
}

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext, int index) {
          return CardWidget();
        });
  }

  Widget CardWidget() {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Complete Booking',
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text(
                          'Id:JPS62WIHW',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/car.jpg',
                          scale: 4,
                        ),
                        Text('Tata Tiago'),
                        Text(
                          'UP 32 Lc 1684',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    VerticalDivider(
                      thickness: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.largecircle_fill_circle,
                              color: Colors.red,
                            ),
                            Text('------------------'),
                            Icon(
                              CupertinoIcons.largecircle_fill_circle,
                              color: Colors.lightGreen,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Start',
                                style: TextStyle(
                                  color: Colors.black54,
                                )),
                            SizedBox(
                              width: 100,
                            ),
                            Text('End',
                                style: TextStyle(
                                  color: Colors.black54,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '9 Aug',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              '9 Aug',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '7 AM',
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              '11 AM',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Stasdasdasdasda',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Refund of 700 initiated',
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class Pedl extends StatefulWidget {
  const Pedl({Key? key}) : super(key: key);

  @override
  State<Pedl> createState() => _PedlState();
}

class _PedlState extends State<Pedl> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
