


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class transactionHisory extends StatefulWidget {
  const transactionHisory({Key? key}) : super(key: key);

  @override
  State<transactionHisory> createState() => _transactionHisoryState();
}

class _transactionHisoryState extends State<transactionHisory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.5,title: Text('Transaction History'),),

    body: SingleChildScrollView(
      child: Column(children: [
        TransactionHistoryWidget()
      ],),
    ),
    );



  }
  Widget TransactionHistoryWidget(){
    return ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount:15,itemBuilder: (BuildContext,int index){
      return Card(
        child: Column(
          children: [
            ListTile(title: Text('Wallet to wallet tranfer,balance added to account'),
              leading: ClipRRect(child: Image.asset('assets/car.jpg'),),trailing: Text('+₹2000',style: TextStyle(color: Colors.green),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 2,color: Colors.green)),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child: Text('Payment'),
                    ) ,),SizedBox(width: 10,),Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text('2020-07-12 18:50:00'),Text('TransactionId G19LWA70'),],)
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
