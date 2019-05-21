import 'package:flutter/material.dart';
import 'package:oat_food_project/screen/authen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Authen()); 

  }
}