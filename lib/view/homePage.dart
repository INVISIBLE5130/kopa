import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopa/core/productModel.dart';
import 'package:kopa/view/itemCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: Container(
        alignment: Alignment.topRight,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image(
                image: AssetImage("assets/header.png"),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 30),
                child: Image(
                  image: AssetImage("assets/filter.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Container(
                    child: ProductCard()
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}