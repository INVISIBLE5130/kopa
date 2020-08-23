import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  SettingsPage({Key key, this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoggedIn = false;
  bool pressed = false;
  Map userProfile;

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
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Card(
                        color: Color.fromARGB(100, 100, 100, 100),
                        child: InkWell(
                          splashColor: Colors.yellow.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
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
                    ),
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