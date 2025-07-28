import 'package:flutter/material.dart';

void main() {
runApp(
MaterialApp(
home: homeApp()
)
);
}

class homeApp extends StatefulWidget{
@override
myApp createState() => myApp();
}

class myApp extends State<homeApp> {
var counter = 0;
Widget build(BuildContext context) {
return Scaffold(
backgroundColor:Colors.blueGrey[300] ,
appBar: AppBar(
title: Row(
children: [
Icon(Icons.email),
Text(
