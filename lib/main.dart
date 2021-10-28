import 'package:contatos_persistencia/screens/dashboard.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MybankApp());
}

class MybankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),//Scaffold
    ); //MaterialApp
  }
}


