import 'package:flutter/material.dart';
import 'package:kopa/core/productModel.dart';

import 'itemPage.dart';

class ProductCard extends StatefulWidget {

  ProductCard({Key key, this.onPressed, this.productDetails}) : super(key: key);

  final Function() onPressed;
  final Product productDetails;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Card(
        color: Color.fromARGB(100, 100, 100, 100),
        child: InkWell(
          splashColor: Colors.yellow.withAlpha(30),
          onTap: () {
            print('Card tapped.');
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemPage()));
          },
          child: Stack(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 130.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/item.png'),
                        fit: BoxFit.cover),
                    borderRadius:
                    BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 2.0, color: Colors.black)
                    ]
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() => { pressed = !pressed });
                    widget.onPressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                          Icons.favorite,
                          color: pressed ? Colors.red : Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 310, bottom: 80),
                  child: Chip(
                    label: Text(
                      "100" + new String.fromCharCodes(new Runes('\u0024')),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    shadowColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    elevation: 10,
                    autofocus: true,
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 170, top: 10),
                child: Text(
                  "Nike 992K",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 170, top: 35),
                child: Text(
                  "Розміри стопи: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 170, top: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "40",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22
                          ),
                        ),
                        Text(
                          "EU",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              "28.5",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              ),
                            ),
                          ),
                          Text(
                            "Довжина / см",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              "10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              ),
                            ),
                          ),
                          Text(
                            "Ширина / см",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 170, top: 105),
                child: Text(
                  "Матеріал: Шкіра",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
