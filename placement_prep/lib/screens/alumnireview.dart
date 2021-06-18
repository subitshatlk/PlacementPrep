import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placement_prep/screens/welcome/alumniform.dart';
class Alumnireview extends StatefulWidget {

  @override
  _AlumnireviewState createState() => _AlumnireviewState();
}

class _AlumnireviewState extends State<Alumnireview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

        title: Text(
          'Alumni Reviews',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),

      ),
      body: StreamBuilder(
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection("alumni").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(13.0),
                  child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.person_outline_rounded, size: 20,),
                                SizedBox(width: 6.0,),
                                Text(data['Name'] + ', ' + data['Dept'],
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.left,),
                              ]
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8.0,),
                          Row(
                            children: <Widget>[
                            Icon(Icons.corporate_fare, size: 20,),
                             Text(' Company : ' +data['Intern'], style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
                             ]
                          ),
                          SizedBox(height: 8.0,),
                          Column(
                              children: <Widget>[
                                SizedBox(width: 50.0,),
                                Text(data['Review'], style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
                              ]
                          )
                        ],
                      )
                  ),
                );
              },
            );
          }else{
            return Center(child : Text('Loading...'));
          }
        },
      ),
    );
  }
}
