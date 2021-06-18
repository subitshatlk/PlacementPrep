import 'package:flutter/material.dart';

import '../welcome.dart';



class AlertPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () async {
                final ConfirmAction action = await _asyncConfirmDialog(context);
                print("Confirm Action $action" );
              },
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 20.0),),
              padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
enum ConfirmAction { Cancel, Accept}
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: const Text(
            'Are you sure you want to logout?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Welcome()),
              );
            },
          )
        ],
      );
    },
  );
}