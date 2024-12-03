
import 'package:flutter/material.dart';

import '../Objects/Purchase.dart';

class PurchaseCard extends StatefulWidget{
  Purchase purchase;
  PurchaseCard({Key? key, required this.purchase}) : super(key: key);

  _PurchaseCardState createState() => _PurchaseCardState();
}

class _PurchaseCardState extends State<PurchaseCard>{

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

                Text(
                  widget.purchase.dateTime.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),


                Text(
                  widget.purchase.game.price.toString()+"€",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            )
        )
    );
  }

}