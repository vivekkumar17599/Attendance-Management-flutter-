
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/AddStudent.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'Homepage.dart';
//import 'main.dart';


class deleteStudent extends StatefulWidget {

  @override
  _deleteStudentState createState() => _deleteStudentState();
}

class _deleteStudentState extends State<deleteStudent> {
  Query ref;

  //DatabaseReference rf;
  //String key;
 //DeleteRecord(){
    //Widget okButton=FlatButton(
      //child: Text("OK"),
     // onPressed: (){
       // setState(() {
         // rf.child('user.id').remove();
       // });
     // };
    //);
  //}
  @override
  void initState(){
    super.initState();
    ref=FirebaseDatabase.instance.reference().child('Students').orderByChild('SName');

   // rf=FirebaseDatabase.instance.reference().child('Students');
    //key= rf.child('Students');
   // key= rf.child('Students').push().getKey();
   //// ref.once().then((DataSnapshot snap ){
     // var data=snap.value;

   // }
   // );
  }



  Widget _deleteStudent({Map Students}){
   return SingleChildScrollView(
     child: ListView(
       shrinkWrap: true,
padding: EdgeInsets.only(left:10.0,right: 10.0),
     children: [

ListTile(
       title:  Text(Students['SName']),
       subtitle: Text(Students['FName']),
       onTap:() {

       } ,
),

       Row(

        crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           RaisedButton(
             color: Colors.red,
             elevation: 5.0,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0),
             ),
             child: Text('DELETE',
             style: TextStyle(
               color: Colors.white,
               fontSize: 18.0
            ),),
            onPressed: (){
            //  DeleteRecord();
              // setState(() {


            // rf.child().remove('Students');
            // Navigator.of(context).pop();
             // });
             },
          ),
         ],
      )




         ],
         ),
   );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Student Record'),
      ),
     body: Container(
       height: double.infinity,
       child: FirebaseAnimatedList(query:ref,itemBuilder:(BuildContext context,
       DataSnapshot snapshot,Animation<double>animation,int index){
         Map student=snapshot.value;
         return _deleteStudent(Students:student);
       }
       ),

     ),
    );
  }
}
