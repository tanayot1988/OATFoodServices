import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:oat_food_project/screen/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showUser() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'User :', hintText: 'Your User'),
    );
  }

  Widget showPW() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'More 6 Charactor'),
    );
  }

  Widget showRegister(BuildContext context) {  //buildcontext เป็นการสร้างการเชื่อมโยงชื่อตัวแปร context
    return RaisedButton(
      child: Text('Register'), //ปุ่ม register
      onPressed: () {
        print('You Click Register');

        //สร้างเส้นทางเชื่อมโยง
        var registerRoute = MaterialPageRoute(builder: (BuildContext) => Register()); //ไปหน้าไฟล์ register.dart โดยการกด ctrl+คลิกที่ register()
        Navigator.of(context).push(registerRoute);


      },
    );
  }

  Widget showLogIn() {
    return RaisedButton(
      child: Text('Log In'),
      onPressed: () {},
    );
  }

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
        resizeToAvoidBottomPadding: false, //แก้คีบอร์ดให้แสดงผลเต็มจอ ไม่error
        //คำสั่งปรับแต่งที่หน้าจอ
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white10, Colors.orange[50]],
                  begin: Alignment(-1, -1))),
          padding: EdgeInsets.only(top: 70.0), //จากบนลงมา 70 พ้อย
          alignment: Alignment(0, -1), //ปรับค่าตำแหน่งหน้าจอ
          child: Column(
            children: <Widget>[
              showLogo(), //แสดงภาพ Logo
              Container(margin: EdgeInsets.only(top: 25.0), child: showTitle()),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showUser(), //แสดงช่อง user
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showPW(), //แสดงช่อง Password
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 50.0, right: 50.0), //ปรับตำแหน่งปุ่ม
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: showLogIn(), //แสดงปุ่ม login กับ register ติดกัน
                    ),
                    showRegister(context) //ดึงชื่อ widget showRegister ที่สร้างด้านบนมาแสดง
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
