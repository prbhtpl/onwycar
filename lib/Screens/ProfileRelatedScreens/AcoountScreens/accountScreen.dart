import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String dropdownValue = 'Male';
  String citiesvalue = 'Delhi';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.5,title: Text('Update Account'),),
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'My Account',
                  style: GoogleFonts.share(fontSize: 25),
                ),
              ),
              Divider(
                endIndent: 30,
                indent: 30,
              ),
              Text(
                ' Account Details',
                style: GoogleFonts.share(fontSize: 18),
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Email'), Text('prbhtpl.pp@gmail.com')],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Mobile*'),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all()),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Text('21345678941'))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Personal Details',
                style: GoogleFonts.lato(fontSize: 18),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 2,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Name *'), Text('prbhtpl.pp@gmail.com')],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gender'),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: const Icon(Icons.arrow_drop_down),
                        ),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Male', 'Female', 'Others']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location Details',
                style: GoogleFonts.lato(fontSize: 18),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                'Please share your current city for optimized experience.',
                style: TextStyle(fontSize: 13.5, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City'),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: citiesvalue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            citiesvalue= newValue!;
                          });
                        },
                        items: <String>[
                          'Maharashtra',
                          'Delhi',
                          'Karnataka',
                          'Andhra Pradesh',
                          'Gujarat'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(onPressed: (){}, child: Text('Update')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
