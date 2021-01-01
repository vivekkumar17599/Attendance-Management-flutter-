import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter_project/MarkStudent.dart';
import 'AddStudent.dart';
import 'viewAttendanceSheet.dart';
import 'deleteStudent.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void display(){
    print("AddStudent");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Management"),
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 12.0,bottom: 60.0),
          margin: EdgeInsets.only(top: 100.0,bottom: 100.0),
          child:Center(
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                RaisedButton(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)) ,
                  child:Text("Add Student",
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  splashColor: Colors.blue,
                  padding:EdgeInsets.only(left:20.0,top: 5.0,right:20.0,bottom: 5.0),
                  color: Colors.green,
                  elevation: 10.0,
                  onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>AddStudent()),
                    ),
                  },
                ),


                RaisedButton(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child:Text("Mark Attendance",
                    style:TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  splashColor: Colors.blue,
                  padding:EdgeInsets.only(left:18.0,top: 5.0,right:18.0,bottom: 5.0),
                  color: Colors.green,
                  elevation: 10.0,
                  onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>MarkAttendance()),
                    ),
                  },
                ),


                RaisedButton(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child:Text("View Attendance Sheet",
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  splashColor: Colors.blue,
                  padding:EdgeInsets.only(left:20.0,top: 5.0,right:20.0,bottom: 5.0),
                  color: Colors.green,
                  elevation: 10.0,
                  onPressed: ()=>{
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>viewAttendanceSheet()),
                    )
                  },
                ),


                RaisedButton(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child:Text("Delete Student",
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  splashColor: Colors.blue,
                  padding:EdgeInsets.only(left:20.0,top: 5.0,right:20.0,bottom: 5.0),
                  color: Colors.green,
                  elevation: 10.0,
                  onPressed: ()=>{
                    Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>deleteStudent()),
                    ),
                  }
      ),

              ],
            ),
          ),

        ),
      ),

    );



  }
}












































