import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Alumniform extends StatefulWidget {
  const Alumniform({Key key, this.name, this.dept,this.intern, this.review}) : super(key: key);

  @override
  AlumniformState createState() => AlumniformState();
  final name;
  final dept;
  final intern;
  final review;
}

class AlumniformState extends State<Alumniform> {
  TextEditingController _nameController,_deptController,_intController,_revController;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _deptController=TextEditingController();
    _intController=TextEditingController();
    _revController=TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Alumni Review', style: TextStyle(fontSize: 20 ,color: Colors.white)),
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
                  (value.isEmpty) ? "Please enter name" : null,
                  decoration: InputDecoration(
                      labelText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.person_outline_rounded,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _deptController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please enter department name" : null,
                  decoration: InputDecoration(
                      labelText: "Department",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.corporate_fare,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _intController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please enter intern company" : null,
                  decoration: InputDecoration(
                      labelText: "Company",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.laptop_chromebook,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _revController,
                  minLines: 2,
                  maxLines: 5,
                  validator: (value) =>
                  (value.isEmpty) ? "Please type review" : null,
                  decoration: InputDecoration(
                      labelText: "Write up",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.fact_check_sharp,size: 30,),
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
                  child: Text('Post it !',style: TextStyle(fontSize: 20 ,color: Colors.white)),
                  onPressed: (){
                    saveData();
                    Navigator.pushNamedAndRemoveUntil(context, 'Alumnireview', (route) => false);
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
  void saveData(){
    String name = _nameController.text;
    String dept = _deptController.text;
    String intern = _intController.text;
    String rev = _revController.text;

    Map<String,String> data = {
      'name':name,
      'dept' :dept,
      'intern' :intern,
      'rev' : rev,
    };

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = FirebaseFirestore.instance.collection('alumni');

      await reference.add({"Name": "$name","Dept": "$dept","Intern": "$intern","Review": "$rev"});
    });
  }
}