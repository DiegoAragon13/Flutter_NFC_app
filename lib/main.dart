import 'package:flutter/material.dart';
import 'package:nfc/Pages/HomePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NFC",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }





}