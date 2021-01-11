
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
class MarkAttendance extends StatefulWidget {
  @override
  _MarkAttendanceState createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
String rad;

  int selectedRadio;
TextEditingController DateController,RadController;
  Query ref;
DatabaseReference rf;

  @override
  void initState(){

   DateController= TextEditingController();
   RadController=TextEditingController();
    super.initState();
    selectedRadio=0;
    ref=FirebaseDatabase.instance.reference().child('Students').orderByChild('SName');
    rf=FirebaseDatabase.instance.reference().child('Attendance');
    saveDetails();
  }
setSelectedRadio(int val){
  setState(() {
    rad='${RadController.text}';
    selectedRadio=val;
    rad=selectedRadio.toString();
    print("$rad");
rf.push().set(rad);
  });
  }

  Widget _buildAttendanceRegister({Map Students}){
    return SingleChildScrollView(
     // height: 100,
      child:Padding(
        padding: EdgeInsets.only(top:30.0,left: 20.0),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          SizedBox(width: 6,),
          Text(Students['SName'],
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),

          ButtonBar(

            alignment: MainAxisAlignment.end,
            children:<Widget> [


              Radio(
                value: 1,
               groupValue:selectedRadio,
                activeColor: Colors.green,
               onChanged:  setSelectedRadio,
              ),
              Text('Present',
              style:TextStyle(
                color: Colors.green,
               fontSize: 25.0,
              )),


              Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.red,
                 onChanged: setSelectedRadio,
                 
                  ),
              Text('Absent',
                  style:TextStyle(
                    color: Colors.red,
                fontSize: 25.0,
              )
              ),
        ],
          ),


        ],


      ),

      )

    );

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Attendance'),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(

          children: <Widget>[
          
            TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please fill the empty field';
                  }
                },
                controller: DateController,
                onTap: () async {
                  DateTime date = DateTime(1990);
                  FocusScope.of(context).requestFocus(
                      new FocusNode());

                  date = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2025),);
                  DateController.text =
                  "${date.day.toString()}-${date.month
                      .toString()}-${date.year
                      .toString()}"; 
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Select Today's date",

                  labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                )
            ),

            FirebaseAnimatedList(query: ref, itemBuilder: (BuildContext context,
                DataSnapshot snapshot, Animation<double>animation, int index) {
              Map student = snapshot.value;
              return _buildAttendanceRegister(Students: student);
            },
              shrinkWrap: true,
            ),

            RaisedButton(
              color: Colors.blue,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                saveDetails();
              },
            )


          ],
        ),

      ),
    );
  }
    void saveDetails()
    {
      String DOB = DateController.text;
      Map<String, String>Details = {
        'DOB': DOB,
      };

rf.push().set(Details);

  }
}



