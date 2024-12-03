

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/PurchaseSuccesfull.dart';
import 'package:http/http.dart' as http;

import '../Objects/Purchase.dart';
import '../Objects/User.dart';
import '../widgets/PurchaseCard.dart';
import '../widgets/PurchaseCardCart.dart';

class CartPage extends StatefulWidget{
  User user;
  CartPage({Key? key, required this.user}):super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{
  late List<Purchase> p;
  Future<List<Purchase>> getPurchasesInCart() async{
    var response=await http.get('http://localhost:8080/purchases/getPurchasesInCart');
    var jsonData=jsonDecode(response.body);
    List<Purchase> cart=[];
    for(var p in jsonData){
      Purchase purchase= Purchase.fromJson(p);
      cart.add(purchase);
    }
    p=cart;
    return cart;
  }

  void checkOut() async{
    await http.get('http://localhost:8080/purchases/checkOut');
    Navigator.push(context, MaterialPageRoute(builder: (context)=> PurchaseSuccessfull(user: widget.user)));
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
                "Games in Cart:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            FutureBuilder(
                future: getPurchasesInCart(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                                return PurchaseCardCart(purchase: snapshot.data[index], user: widget.user);
                              }
                          )
                      )
                  );
                }
                ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                primary: Color.fromRGBO(54, 89, 241, 1.0),
              ),
              child: Text(
                "Check out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              onPressed: (){ if(p.isNotEmpty){checkOut();}},
            )






          ],
        ),
      ),
    );
  }

}

