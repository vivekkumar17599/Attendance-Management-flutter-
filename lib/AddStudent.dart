
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';



class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  var _formkey= GlobalKey<FormState>();

  DateTime _dateTime;
  TextEditingController NameController, FNameController,AddressController,DateController,NumController;
  DatabaseReference ref;

  @override

  void initState(){
    super.initState();
    NameController= TextEditingController();
    FNameController= TextEditingController();
    DateController=TextEditingController();
    AddressController=TextEditingController();
    NumController=TextEditingController();
    ref=FirebaseDatabase.instance.reference().child('Students');
    saveDetails();

  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Student's detail"),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[

                      TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please fill the empty field';
                          }
                        },
                        controller: NameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          // filled:true,
                          labelText: 'Name :',
                          labelStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                          ),
                          //hintText: 'Enter students name',
                         // hintStyle: TextStyle(
                           // color: Colors.black,
                          //  fontSize: 20.0,
                         // ),
                          icon: Icon(Icons.account_circle),
                        ),

                      ),


                      TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please fill the empty field';
                          }
                        },
                        controller: FNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          // filled:true,
                          labelText: 'Fathers name :',
                          labelStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                          ),
                         // hintText: 'Enter Fathers name',
                          //hintStyle: TextStyle(
                            //color: Colors.black,
                           // fontSize: 20.0,
                         // ),
                          icon: Icon(Icons.account_circle),
                        ),

                      ),


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
                                .toString()}"; //date.toString();
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: 'Select D.O.B',

                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                            ),
                          )
                      ),


                      TextFormField(
                        // key: _formkey,
                        controller: AddressController,
                        keyboardType: TextInputType.name,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please fill the empty field';
                          }
                        },
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Address :',
                          labelStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                          ),
                          //hintText: 'Enter students address',
                          //hintStyle: TextStyle(
                           // color: Colors.black,
                            //fontSize: 20.0,
                         // ),
                          icon: Icon(Icons.add_circle_outline),
                        ),

                      ),


                      TextFormField(
                        controller: NumController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Pleaae fill the empty field';
                          }
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          // filled: true,
                          // border: UnderlineInputBorder(),
                          labelText: 'Contact Number :',
                          labelStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                          ),
                          hintText: 'Enter Contact number',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          icon: Icon(Icons.phone),
                        ),

                      ),

                      RaisedButton(

                        color: Colors.blue,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text('Save',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                           if (_formkey.currentState.validate()) {
                             saveDetails();
                           }
                          });
                        showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30.0),
                              ),
                                title: Text("Student Added successfully")

                            );
                          }
                          );
                         // setState(() {
                            //if (_formkey.currentState.validate()) {
                             // saveDetails();
                            //}
                          //});
                        }
                      ),
                    ]
                ),
              )

          )
      ),
    );
  }
    void saveDetails() {
      String SName = NameController.text;
      String FName = FNameController.text;
      String Address = AddressController.text;
      String DOB= DateController.text;
      String num = NumController.text;
      Map<String, String>Details = {
        'SName': SName,
        'FName': FName,
        'Address': Address,
         'DOB'  : DOB,
        'Number': num,
      };
      ref.push().set(Details);
    }

}


