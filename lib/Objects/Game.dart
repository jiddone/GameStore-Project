import 'dart:convert';

class Game {
  int id;
  String name;
  String description;
  double price;

  Game({required this.id, required this.name, required this.description, required this.price});

  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']
    );
  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name':name,
    'description': description,
    'price': price
  };

}