import 'package:flutter/material.dart';

//import 'package:kopa/core/CRUDModel.dart';
//import 'package:kopa/core/router.dart';
import 'package:provider/provider.dart';
import 'package:kopa/core/ui/mainViewStatefulWidget.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(KopaApp());
}

class KopaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnterPage(),
    );
  }
}

//      providers: [
//        ChangeNotifierProvider(builder: (_) => locator<CRUDModel>()),
//      ],
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        initialRoute: '/',
//        onGenerateRoute: Router.generateRoute,
