import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/GameCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Objects/Game.dart';
import '../Objects/User.dart';

class Home extends StatefulWidget {
  User user;

  Home({Key? key, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  Future<List<Game>> getAllGames() async{
      var response=await http.get('http://localhost:8080/games/allGames');
      var jsonData=jsonDecode(response.body);

      List<Game> games=[];
      for(var g in jsonData){
        Game game=Game(id: g["id"], name: g["name"], description: g["description"], price: g["price"]);
        games.add(game);
      }
      return games;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "All Games Available:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
              ),
            ),
            FutureBuilder(
                future: getAllGames(),
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
                                return GameCard(
                                  game: snapshot.data[index],
                                  user: widget.user,
                                );
                              }
                          )
                      )
                  );
                }
                )
           

          ],
        ),
      ),
    );
  }


}
