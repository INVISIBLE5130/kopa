import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {

  ItemPage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Card(
                      color: Color.fromARGB(100, 100, 100, 100),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 400.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/item.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(blurRadius: 2.0, color: Colors.black)
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.only(left: 15, top: 15),
                                    alignment: Alignment.centerLeft,
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
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 15, top: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => { pressed = !pressed });
                                    widget.onPressed();
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: pressed ? Colors.red : Colors.white,
                                    size: 50,
                                  ),
                                )
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nike 992K",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Розміри стопи: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            alignment: Alignment.centerLeft,
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
                            padding: EdgeInsets.only(left: 15, top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Матеріал: Шкіра",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/seller.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Seller',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                                Text(
                                  'Ukraine, Vinnytsia',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image(
                          image: AssetImage('assets/call.png'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}