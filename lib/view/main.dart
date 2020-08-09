import 'package:flutter/material.dart';
import 'package:kopa/core/ui/mainViewStatefulWidget.dart';

void main() {
  runApp(KopaApp());
}

class KopaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnterPage(),
    );
  }
}