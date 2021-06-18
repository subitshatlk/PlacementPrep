import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prep/models/userdetail.dart';
import 'package:placement_prep/screens/displayuserdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placement_prep/widgets/provider_widget.dart';
class Getotherdetails extends StatelessWidget{
  final db = FirebaseFirestore.instance;
  
  final Userdetails userdetails;
  Getotherdetails ({Key key,@required this.userdetails}):super(key:key);

  @override
  Widget build(BuildContext context){
    TextEditingController _nameController = new TextEditingController();
    _nameController.text = userdetails.name;
    TextEditingController _rollController = new TextEditingController();
    _rollController.text = userdetails.roll;
    TextEditingController _deptController = new TextEditingController();
    _deptController.text = userdetails.department;
    TextEditingController _yearController = new TextEditingController();
    _yearController.text = userdetails.year;
    TextEditingController _interestController = new TextEditingController();
    _interestController.text = userdetails.interestType;
    return Scaffold(
      backgroundColor: Color(0xFFCFD8DC),
        appBar: AppBar(
          title: Text('Create Profile'),
          backgroundColor: Colors.indigo,
          toolbarHeight: 70,
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),borderSide: BorderSide(color: Colors.black, width: 1),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),hintText: "Enter your name",fillColor: Colors.white,filled: true),
                  controller: _nameController ,
                  autofocus:true ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: new InputDecoration(
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),borderSide: BorderSide(color: Colors.black, width: 1),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    contentPadding: EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),hintText: "Enter register number",fillColor: Colors.white,filled: true),
                  controller: _rollController ,
                  autofocus:true ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),borderSide: BorderSide(color: Colors.black, width: 1),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),hintText: "Enter department",fillColor: Colors.white,filled: true),
                  controller: _deptController ,
                  autofocus:true ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),borderSide: BorderSide(color: Colors.black, width: 1),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),hintText: "Enter your year of course study",fillColor: Colors.white,filled: true),
                  controller: _yearController ,
                  autofocus:true ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: new InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),borderSide: BorderSide(color: Colors.black, width: 1),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),hintText: "Enter interest type",fillColor: Colors.white,filled: true),
                  controller: _interestController ,
                  autofocus:true ,
                ),
              ),
              SizedBox(height: 18,),
              RaisedButton(
                  child: Text("SAVE",style: TextStyle(color: Colors.white),),
                  onPressed: ()async {
                    userdetails.name=_nameController.text;
                    userdetails.roll=_rollController.text;
                    userdetails.department=_deptController.text;
                    userdetails.year=_yearController.text;
                    userdetails.interestType=_interestController.text;
                    final uid = await Provider.of(context).auth.getCurrentUID();
                    await db.collection("users").doc(uid).collection("userdetail").add(userdetails.toJson());
                    Navigator.pushNamedAndRemoveUntil(context, 'Displayuserdetails', (route) => false);
                    },
                color:Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
        )
    );
  }
}