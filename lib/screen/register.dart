import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

// พิมพ์แค่ stl แล้วกด ctrl+spacber เลือก statefulwidget ที่ขึ้นมาแบบ autocomplete
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//Widget เป็นการสร้างวัตถุขึ้นมาเช่น text button

  final getFormKey =
      GlobalKey<FormState>(); //รับค่าจากการพิมพ์ช่อง text ทั้งหมดที่สร้างไว้

  String name, user, pw; //สร้างตัวแปรแบบ string

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons
          .cloud_upload), //เอาชื่อไฟล์จากเว็ป https://material.io มาใส่แทนให้แสดง Icon ได้เลย
      onPressed: () {
        //onPressed = เมื่อมีการกดปุ่ม
        if (getFormKey.currentState.validate()) {
          getFormKey.currentState.save(); //บันทึกค่าที่รับจากแป้นพิมพ์
          print('name = $name, user=$user, Password = $pw');
          uploadValtoserv();
        }
      },
    );
  }


  void uploadValtoserv() async{
      //สร้างการอัพโหลดข้อมูลไปยังเซิฟเวอร์
      String urlphp = 'http://androidthai.in.th/tid/addUserOAT.php?isAdd=true&Name=$Name&User=$User&Password=$Password';
      var response = await get(urlphp);   //ทำต่อไปเรื่อยๆ จนกว่าจะได้ค่า (สำเร็จ)
      var resulttxt = json.decode(response.body); //นำค่าที่ได้จาก response มาแสดงในส่วนของ body
      print('resulttxt ==> $resulttxt');
  }

  Widget nameTxtFromField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: 'ชื่อ :', hintText: 'กรุณาพิมพ์ชื่อ'),
        validator: (String value) {
          //สร้างตัวแปรเพื่อรับค่าพิมพ์ ชื่อว่า value
          if (value.length == 0) {
            return 'กรุณากรอกข้อมูลด้วยนะโว้ยย..ครับ';
          }
        },
        onSaved: (String namedata) {
          name = namedata;
        });
  }

  Widget userTxtFromField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username :',
        hintText: 'พิมพ์ Username',
      ),
      validator: (String value) {
        if (value.length == 0) {
          return 'ต้องระบุ Username ด้วยซิโว้ยยย...ครับ';
        }
      },
      onSaved: (String userData) { //บันทึกค่า จากตัวแปรด้านบน = ตัวแปรที่สร้าง String
        user = userData;
      },
    );
  }

  Widget passwordTxtFromField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'พิมพ์รหัสผ่าน 6 ตัวอักษร'),
      validator: (String value) {
        if (value.length < 6) {
          return 'ต้องกรอกรหัสผ่านให้ครบ 6 ตัว ดิครับ';
        }
      },
      onSaved: (String pwData) {
        pw = pwData;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false, //แก้คีบอร์ดให้แสดงผลเต็มจอ ไม่error
        appBar: AppBar(
            title: Text('สมัครสมาชิก (Register)'),
            actions: <Widget>[registerButton()]),
        body: Form(
          key:
              getFormKey, //เอาตัวแปรรับค่า มาใส่ในส่วน body ให้ทำการเช็คช่อง text
          child: Container(
            padding: EdgeInsets.all(
                50.0), //สร้างเหมือนถุงเพื่อใส่วัตถุ ห่างจากทุกขอบ 50 พ้อย
            child: Column(
              //กำหนดคอลั่มเป็นแนวตั้ง
              children: <Widget>[
                nameTxtFromField(), //ใส่ widgetที่สร้างไว้ (nameTxtFromField)
                userTxtFromField(),
                passwordTxtFromField()
              ],
            ),
          ),
        ));
  }
}
