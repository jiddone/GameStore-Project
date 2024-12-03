


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Objects/User.dart';
import 'dashboardCart.dart';
class PurchaseSuccessfull extends StatefulWidget {
  User user;
  PurchaseSuccessfull({Key? key, required this.user}) : super(key: key);


  @override
  _PurchaseSuccessfullState createState() => _PurchaseSuccessfullState();
}

class _PurchaseSuccessfullState extends State<PurchaseSuccessfull>{

  void emptyCart() async{
    http.get("http://localhost:8080/purchases/emptyCart");
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardCart(title: 'Gamestore', user: widget.user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check Out",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
              "Payment went through successfully",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Color.fromRGBO(54, 89, 241, 1.0),
                ),
                child: Text(
                  "Back to Cart section",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                onPressed: (){ emptyCart(); },
              )
            ],
          )
      )
    );
  }

}

