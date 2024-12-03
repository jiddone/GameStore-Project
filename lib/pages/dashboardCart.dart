import 'package:flutter/material.dart';
import 'package:frontend/pages/CartPage.dart';
import 'package:frontend/pages/SearchByPrice.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Objects/User.dart';
import 'Home.dart';
import 'SearchByTitle.dart';
import 'UserPage.dart';


class DashboardCart extends StatefulWidget {
  final String title;
  User user;
  DashboardCart({Key? key, required this.title, required this.user}) : super(key: key);

  @override
  _DashboardCartState createState() => _DashboardCartState(title);
}

class _DashboardCartState extends State<DashboardCart> {
  String title="GameStore";

  _DashboardCartState(String title){
    this.title=title;
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      initialIndex: 3,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(54, 89, 241, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
              ),
            ),
            title: Text(title, style: GoogleFonts.pacifico(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
          )),
          bottom: TabBar(
            tabs: [
              Tab(text: "home", icon: Icon(Icons.home_rounded)),
              Tab(text: "search by title", icon: Icon(Icons.search_rounded)),
              Tab(text: "search by price", icon: Icon(Icons.search_rounded)),
              Tab(text: "cart", icon: Icon(Icons.shopping_cart_rounded)),
              Tab(text: "user", icon: Icon(Icons.person_rounded))

            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(user: widget.user),
            Search(user: widget.user),
            SearchByPrice(user: widget.user),
            CartPage(user: widget.user),
            UserPage(user: widget.user,)

          ],
        ),
      ),
    );
  }

}

