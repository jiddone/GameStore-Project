import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Objects/Game.dart';
import '../Objects/User.dart';
import 'SearchByNameResults.dart';

class Search extends StatefulWidget{
  User user;
  Search({Key? key, required this.user});

  @override
  State<StatefulWidget> createState() => _SearchState();


}

class _SearchState extends State<Search>{
  TextEditingController _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      height: 1.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(54, 89, 241, 1.0),
                        ),
                      ),
                      fillColor: Theme.of(context).primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(54, 89, 241, 1.0),
                        ),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(54, 89, 241, 1.0),
                        ),
                      ),
                      labelText: "search games by name",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(54, 89, 241, 1.0),
                      ),
                    ),
                  ),
                ),
                  Padding(
                      padding: EdgeInsets.all(3),
                      child: RawMaterialButton(
                        onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByNameResults(user: widget.user, name: _searchController.text)));
                        },
                        elevation: 2.0,
                        fillColor: Color.fromRGBO(54, 89, 241, 1.0),
                        child: Icon(Icons.search_rounded, color: Theme.of(context).backgroundColor),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                    ),
              ],
            ),
          ],
        )
      );
  }

}

