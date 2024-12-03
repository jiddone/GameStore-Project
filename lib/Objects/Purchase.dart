import 'package:frontend/Objects/user.dart';
import 'package:intl/intl.dart';
import 'Game.dart';

class Purchase{
  int id;
  User user;
  Game game;
  DateTime dateTime;



  Purchase({required this.id, required this.game, required this.user, required this.dateTime});

  factory Purchase.fromJson(Map<String, dynamic> json){
    return Purchase(
      id: json['id'],
      user: User.fromJson(json['buyer']),
      game: Game.fromJson(json['game']),
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['purchaseTime']),
    );
  }

  Map<String, dynamic> toJson() =>{
    'id':id,
    'buyer': user.toJson(),
    'game': game.toJson(),
    'purchaseTime': dateTime.millisecondsSinceEpoch,
  };

}