import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placement_prep/models/userdetail.dart';
import 'package:placement_prep/screens/home_screen.dart';
import 'package:placement_prep/services/auth_service.dart';
import 'package:placement_prep/widgets/provider_widget.dart';

class Displayuserdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return Scaffold(
        body: new Stack(children: <Widget>[
          ClipPath(
            child: Container(color: Colors.indigo.withOpacity(0.4)),
            clipper: getClipper(),
          ),
          Center(
            child: Container(
              width: 500,
              height: 900,
             // color: Colors.white,
              child: StreamBuilder(
                  stream: getUsersDetailsStreamSnapshots(context),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text("Loading ... ");
                    return Center(
                      child: new ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(30.0),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Align(
                                  child: buildUserCard(
                                      context, snapshot.data.docs[index]))),
                    );
                  }),
            ),
          ),
        ]));
  }

  Stream<QuerySnapshot> getUsersDetailsStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('userdetail')
        .snapshots();
  }

  Widget buildUserCard(BuildContext context, DocumentSnapshot userdetail) {
    final newUser = new Userdetails(null, null, null, null, null);
    return new Container(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        //color:Colors.blueGrey,
        //elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      Text(
                        ' ' + userdetail.data()['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                    ],
                  )),
              FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.person),
                      Text(
                        'Register no : ' + userdetail.data()['roll'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )),
              FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.person),
                      Text(
                        'Department : ' + userdetail.data()['department'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )),
              FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.person),
                      Text(
                        'Year : ' + userdetail.data()['year'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )),
              FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.person),
                      Text(
                        'Interest : ' + userdetail.data()['interestType'],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2.6);
    path.lineTo(size.width + 160, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
