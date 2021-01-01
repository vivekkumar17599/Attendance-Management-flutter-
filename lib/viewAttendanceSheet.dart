import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';

class viewAttendanceSheet extends StatefulWidget {
  @override
  _viewAttendanceSheetState createState() => _viewAttendanceSheetState();
}

class _viewAttendanceSheetState extends State<viewAttendanceSheet> {
  Query ref;
  @override
  void initState(){
    super.initState();
    ref=FirebaseDatabase.instance.reference().child('Students').orderByChild('SName');
  }
  Widget _Register({Map Students}) {
    return SingleChildScrollView(
      // height: 100,
      
        child: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 20.0),

            child: ListView(
              shrinkWrap: true,

                children: [
Material(
  child: ListTile(
  title: Text(Students['SName']),
  subtitle: Text(Students['FName']),
  onTap: (){},
),
),
                ]
            )
        )
    );
  }
    Widget build(BuildContext context) {
    return MaterialApp(

home: Container(

         child:  FirebaseAnimatedList(query:ref,itemBuilder:(BuildContext context,
            DataSnapshot snapshot,Animation<double>animation,int index){
          Map student=snapshot.value;
          return _Register(Students:student);
        }
        ),
),
    );



  }
}
