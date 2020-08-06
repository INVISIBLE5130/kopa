import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Column(
            children: [
              Image(
                image: AssetImage("assets/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/enter.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70, top: 30),
                            child: Text("Enter", style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                            ),),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Stack(
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/greenCircle.png")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 65, top: 60),
                              child: Image(
                                  image: AssetImage("assets/phone.png")
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Container(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Stack(
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/blueCircle.png")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 65, top: 60),
                              child: Image(
                                  image: AssetImage("assets/facebook.png")
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Container(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Stack(
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/redCircle.png")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 65, top: 60),
                              child: Image(
                                  image: AssetImage("assets/google.png")
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
      )
    );
  }
}