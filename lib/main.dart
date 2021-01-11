import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'AddStudent.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Management',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new Homepage(),
    );
  }
}
