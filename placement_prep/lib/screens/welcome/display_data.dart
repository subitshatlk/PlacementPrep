import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DisplayData extends StatefulWidget {
  const DisplayData({Key key, this.name, this.dept, this.link,this.desc, this.job}) : super(key: key);

  @override
  _DisplayDataState createState() => _DisplayDataState();
  final name;
  final link;
  final dept;
  final desc;
  final job;
}

class _DisplayDataState extends State<DisplayData> {
  TextEditingController _nameController,_linkController,_deptController,_descController,_jobController;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _linkController = TextEditingController();
    _deptController=TextEditingController();
    _jobController = TextEditingController();
    _descController=TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Save Details', style: TextStyle(fontSize: 20 ,color: Colors.white)),

      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
              InputDecoration(
                hintText: 'Enter Company Name',
                prefixIcon:Icon(Icons.home_work_outlined,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _linkController,
              decoration:
              InputDecoration(
                hintText: 'Enter Link',
                prefixIcon:Icon(Icons.link_sharp,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _jobController,
              decoration:
              InputDecoration(
                hintText: 'Enter Job type',
                prefixIcon:Icon(Icons.local_mall_outlined,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _deptController,
              decoration:
              InputDecoration(
                hintText: 'Enter department',
                prefixIcon:Icon( Icons.corporate_fare,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: _descController,
              decoration:
              InputDecoration(
                hintText: 'Description',
                prefixIcon:Icon(Icons.fact_check_sharp,size: 30,),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: Text('Save Details',style: TextStyle(fontSize: 20 ,color: Colors.white)),
                onPressed: (){
                  saveData();
                  Navigator.pushNamedAndRemoveUntil(context, 'admin_home', (route) => false);
                },
                color: Theme.of(context).primaryColor,

              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
  void saveData(){
    String name = _nameController.text;
    String link = _linkController.text;
    String dept = _deptController.text;
    String job = _jobController.text;
    String desc = _descController.text;

    Map<String,String> data = {
      'name':name,
      'link':link,
      'dept' :dept,
      'job' : job,
      'desc' : desc,
    };

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = FirebaseFirestore.instance.collection('data');

      await reference.add({"Name": "$name", "Link": "$link","Dept": "$dept", "Job": "$job","Desc": "$desc"});
    });
    //_ref.push().set(data).then((value) {
    // Navigator.pop(context);
    //});

  }
}