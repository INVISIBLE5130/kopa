import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopa/view/addItemPage.dart';
import 'package:kopa/view/homePage.dart';
import 'package:kopa/view/itemPage.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomePage()
        );
      case '/addProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddItemPage()
        ) ;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ItemPage()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            )
        );
    }
  }
}