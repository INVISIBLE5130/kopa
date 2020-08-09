import 'package:flutter/material.dart';
import 'package:kopa/view/homePage.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopa/view/phoneAuth.dart';

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
    if (facebookLogin.logOut() != null) {
      facebookLogin.logOut();
      setState(() {
        isLoggedIn = false;
      });
    } else if (googleSignIn.signOut() != null) {
      googleSignIn.signOut();
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  loginWithGoogle() async{
    try{
      await googleSignIn.signIn();
      setState(() {
        isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
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
                padding: const EdgeInsets.only(top: 45),
                child: Row(
                  children: <Widget>[
                    PhoneLogin(),
                    Container(
                        child: GestureDetector(
                          onTap: () {
                            loginWithFB();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              RawMaterialButton(
                                padding: EdgeInsets.all(32.5),
                                fillColor: Colors.blueAccent,
                                shape: CircleBorder(),
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
                            loginWithGoogle();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  padding: EdgeInsets.all(32.5),
                                  fillColor: Colors.red,
                                  shape: CircleBorder(),
                                ),
                                Image(
                                    image: AssetImage("assets/google.png")
                                ),
                              ],
                            ),
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