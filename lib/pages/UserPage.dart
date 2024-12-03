

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/Auth/login.dart';
import 'package:frontend/pages/MyPurchases.dart';
import 'package:http/http.dart' as http;
import '../Objects/Game.dart';
import '../Objects/Purchase.dart';
import '../Objects/User.dart';

class UserPage extends StatefulWidget{
  User user;
  UserPage({Key? key, required this.user}): super(key: key);

  @override
  _UserPageState createState() => _UserPageState();

}

class _UserPageState extends State<UserPage>{

  void emptyCart() async{
    http.get("http://localhost:8080/purchases/emptyCart");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
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
                      "show my purchases",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                          ),
                        ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(5), primary: Color.fromRGBO(54, 89, 241, 1.0),),
                  child: Icon(Icons.arrow_circle_right_outlined),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyPurchases(user: widget.user)));
                    },
                    )
                  ],
                ),
              ),
            ),
        Card(
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
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(5), primary: Color.fromRGBO(54, 89, 241, 1.0),),
              child: Icon(Icons.arrow_circle_right_outlined),
              onPressed: (){
                emptyCart();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              },
            )

                  ],
                ),
              ),
            ),
          ]
        ),
      )
    );

  }

}