
import 'package:contact_project/scr/pages/home.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     title: "contactApp",
     theme: ThemeData(
       primarySwatch: Colors.deepOrange
     ),
     debugShowCheckedModeBanner: false,
     home : HomePage(),
   );
  }
}

