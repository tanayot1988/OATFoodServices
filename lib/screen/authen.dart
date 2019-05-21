import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showLogo() {
    return Image.asset('img/logo.png');
  }

  Widget showTitle() {
    return Text(
      'OAT Food Services',
      style: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.lightBlue),
    ); //สร้างการแสดงข้อความ+การปรับแต่ง
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //คำสั่งปรับแต่งที่หน้าจอ
        body: Container(
      margin: EdgeInsets.only(top: 70.0), //จากบนลงมา 70 พ้อย
      alignment: Alignment(0, -1), //ปรับค่าตำแหน่งหน้าจอ
      child: Column(
        children: <Widget>[
          showLogo(),
          Container(margin: EdgeInsets.only(top: 25.0),
            child: showTitle()
          ),
        ],
      ), //ดึงชื่อ widget ที่สร้างด้านบนมาแสดง
    ));
  }
}
