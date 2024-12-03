import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/SearchByPriceResult.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Objects/Game.dart';
import '../Objects/User.dart';
import 'SearchByNameResults.dart';

class SearchByPrice extends StatefulWidget {
  User user;

  SearchByPrice({Key? key, required this.user}) : super(key: key);

  @override
  _SearchByPriceState createState() => _SearchByPriceState();

}

class _SearchByPriceState extends State<SearchByPrice>{
  @override
  Widget build(BuildContext context) {
    TextEditingController _minController=TextEditingController();
    TextEditingController _maxController=TextEditingController();

    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    controller: _minController,
                    style: TextStyle(
                      height: 1.0,
                      color: Color.fromRGBO(54, 89, 241, 1.0),
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
                      labelText: "enter min price",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(54, 89, 241, 1.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    controller: _maxController,
                    style: TextStyle(
                      height: 1.0,
                      color: Color.fromRGBO(54, 89, 241, 1.0),
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
                      labelText: "enter max price",
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
                      if(_minController.text.isNotEmpty && _maxController.text.isNotEmpty)
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByPriceResults(user: widget.user, minPrice: _minController.text, maxPrice: _maxController.text)));
                      else if(_minController.text.isEmpty && _maxController.text.isNotEmpty){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByPriceResults(user: widget.user, minPrice: "0", maxPrice: _maxController.text)));
                      }else if(_minController.text.isNotEmpty && _maxController.text.isEmpty){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByPriceResults(user: widget.user, minPrice: _minController.text, maxPrice: "unbounded")));
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchByPriceResults(user: widget.user, minPrice: "0", maxPrice: "unbounded")));
                      }

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


