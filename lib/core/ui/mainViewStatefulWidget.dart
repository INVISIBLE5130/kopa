import 'package:flutter/material.dart';
import 'package:kopa/view/homePage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class EnterPage extends StatefulWidget {

  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  bool isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  loginWithFB() async{
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => isLoggedIn = false );
        break;
    }

  }

  logout() {
    facebookLogin.logOut();
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1,229,229,229),
      body: isLoggedIn ? HomePage() : Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/greenCircle.png")
                              ),
                              Image(
                                  image: AssetImage("assets/phone.png")
                              ),
                            ],
                          ),
                        )
                    ),
                    Container(
                        child: GestureDetector(
                          onTap: () {
                            loginWithFB();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/blueCircle.png")
                              ),
                              Image(
                                  image: AssetImage("assets/facebook.png")
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
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/redCircle.png")
                              ),
                              Image(
                                  image: AssetImage("assets/google.png")
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}