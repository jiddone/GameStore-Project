
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/dashboardCart.dart';
import '../Objects/User.dart';
import 'package:frontend/pages/dashboard.dart';
import 'package:http/http.dart' as http;
import '../Objects/Purchase.dart';
import '../pages/CartPage.dart';

class PurchaseCardCart extends StatefulWidget{
  Purchase purchase;
  User user;
  PurchaseCardCart({Key? key, required this.purchase, required this.user}) : super(key: key);

  _PurchaseCardCartState createState() => _PurchaseCardCartState();
}

class _PurchaseCardCartState extends State<PurchaseCardCart>{
  
  void removePurchase(int id) async{

    await http.get('http://localhost:8080/purchases/removeFromCart?id='+id.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardCart(title: 'Gamestore', user: widget.user)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  widget.purchase.game.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.purchase.game.price.toString()+"€",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(5), primary: Color.fromRGBO(54, 89, 241, 1.0),),
                      child: Icon(Icons.close_rounded),
                      onPressed: (){
                        removePurchase(widget.purchase.game.id);
                      },
                    )

                  ],
                )

              ],
            )
        )
    );
  }

}