import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oat_food_project/screen/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(home: Authen()); //ไปเรียกไฟล์ authen.dart มาแสดง
  }
}
