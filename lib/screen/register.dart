import 'package:flutter/material.dart';

// พิมพ์แค่ stl แล้วกด ctrl+spacber เลือก statefulwidget ที่ขึ้นมาแบบ autocomplete
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//Widget เป็นการสร้างวัตถุขึ้นมาเช่น text button

  final getFormKey =
      GlobalKey<FormState>(); //รับค่าจากการพิมพ์ลงช่อง text ทั้งหมดที่สร้างไว้

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons
          .cloud_upload), //เอาชื่อไฟล์จากเว็ป https://material.io มาใส่แทนให้แสดง Icon ได้เลย
      onPressed: () {},
    );
  }

  Widget nameTxtFromField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'ชื่อ :', hintText: 'กรุณาพิมพ์ชื่อ'),
    );
  }

  Widget userTxtFromField() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: 'Username :',
      hintText: 'พิมพ์ Username',
    ));
  }

  Widget passwordTxtFromField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'พิมพ์รหัสผ่าน 6 ตัวอักษร'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('สมัครสมาชิก (Register)'),
            actions: <Widget>[registerButton()]),
        body: Form(
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
