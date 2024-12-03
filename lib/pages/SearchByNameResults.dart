import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Objects/Game.dart';
import '../Objects/User.dart';
import '../widgets/GameCard.dart';

class SearchByNameResults extends StatefulWidget{
  User user;
  String name;
  SearchByNameResults({Key? key, required this.user, required this.name}) : super(key: key);

  @override
  _SearchByNameResultsState createState() => _SearchByNameResultsState();


}

class _SearchByNameResultsState extends State<SearchByNameResults>{

  Future<List<Game>> getGamesByName(String name) async{
    var response=await http.get('http://localhost:8080/games/search/by_name?name='+name);
    var jsonData=jsonDecode(response.body);

    List<Game> games=[];
    for(var g in jsonData){
      Game game=Game.fromJson(g);
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
                "Result for search "+widget.name+":" ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            FutureBuilder(
                future: getGamesByName(widget.name),
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
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                primary: Color.fromRGBO(54, 89, 241, 1.0),
              ),
              child: Text(
                "Back to Search section",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
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