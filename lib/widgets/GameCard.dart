import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/Objects/Game.dart';
import 'package:http/http.dart' as http;
import '../Objects/User.dart';

class GameCard extends StatefulWidget {
  final Game game;
  final User user;

  GameCard({Key? key, required this.game, required this.user}) : super(key: key);

  _GameCardState createState() => _GameCardState();


}

class _GameCardState extends State<GameCard>{
  String url="http://localhost:8080/purchases/addToCart";

  Future sendPurchase() async{
    var res=await http.post( url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"id": widget.game.id,
    "email": widget.user.email}));
    print(res.body);


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
                Column(
                  children: [
                    Text(
                      widget.game.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.game.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.game.price.toString()+'€',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(5), primary: Color.fromRGBO(54, 89, 241, 1.0),),
                      child: Icon(Icons.shopping_cart),
                      onPressed: (){
                        sendPurchase();
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
