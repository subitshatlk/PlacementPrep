import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Technologyform extends StatefulWidget {
  const Technologyform({Key key, this.Name, this.Description}) : super(key: key);

  @override
  TechnologyformState createState() => TechnologyformState();
  final Name;
  final Description;

}

class TechnologyformState extends State<Technologyform> {
  TextEditingController _nameController,_descController;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descController=TextEditingController();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Latest Technology', style: TextStyle(fontSize: 20 ,color: Colors.white)),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 40),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please technology name" : null,
                  decoration: InputDecoration(
                      labelText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.topic_outlined,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _descController,
                  validator: (value) =>
                  (value.isEmpty) ? "Description" : null,
                  decoration: InputDecoration(
                      labelText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.comment_rounded,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),


              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text('Submit',style: TextStyle(fontSize: 20 ,color: Colors.white)),
                  onPressed: (){
                    saveDatas();
                   // Navigator.pushNamedAndRemoveUntil(context, 'Technology', (route) => false);
                  },
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
  void saveDatas(){
    String Name = _nameController.text;
    String Description = _descController.text;


    Map<String,String> data = {
      'Name':Name,
      'Description' :Description,

    };

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = FirebaseFirestore.instance.collection('technology');

      await reference.add({"Name": "$Name","Description": "$Description"});
    });
  }
}