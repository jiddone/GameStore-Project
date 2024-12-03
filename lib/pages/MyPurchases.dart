


import 'package:flutter/material.dart';
import 'package:frontend/Objects/User.dart';
import 'package:frontend/widgets/PurchaseCard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Objects/Purchase.dart';

class MyPurchases extends StatefulWidget{
  User user;
  MyPurchases({Key? key, required this.user});

  _MyPurchasesState createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases>{

  Future<List<Purchase>> findPurchaseByUser(User user) async{
    var response= await http.get("http://localhost:8080/purchases/findByUser?email="+user.email);
    var jsonData=jsonDecode(response.body);
    print(jsonData);

    List<Purchase> purchases=[];
    for(var p in jsonData){
      Purchase purchase=Purchase.fromJson(p);
      purchases.add(purchase);
    }

    return purchases;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "My Purchases:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            FutureBuilder(
                future: findPurchaseByUser(widget.user),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot);
                  if (snapshot.data == null) {
                    return Container(child: Center(child: Icon(Icons.error)));
                  }
                  return Expanded(
                      child: Container(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return PurchaseCard(purchase: snapshot.data[index]);
                              }
                          )
                      )
                  );
                }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                primary: Color.fromRGBO(54, 89, 241, 1.0),
              ),
              child: Text(
                "Back to user page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              onPressed: (){ Navigator.pop(context);},
            )



          ],
        ),
      ),
    );
  }

}