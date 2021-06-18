import 'package:flutter/material.dart';
import 'package:placement_prep/models/userdetail.dart';
import 'package:placement_prep/screens/getotherdetails.dart';
import 'package:placement_prep/services/auth_service.dart';
import 'package:placement_prep/widgets/provider_widget.dart';

class Getuserdetails extends StatelessWidget{
  final Userdetails userdetails;
  Getuserdetails ({Key key,@required this.userdetails}):super(key:key);

  @override
  Widget build(BuildContext context){
    //final AuthService auth = Provider.of(context).auth;
    TextEditingController _nameController = new TextEditingController();
    _nameController.text = userdetails.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Enter your name"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: _nameController ,
                autofocus:true ,
              ),
            ),
            RaisedButton(
              child: Text("Continue"),
                onPressed: (){
                userdetails.name=_nameController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Getotherdetails(userdetails:userdetails)),
                );
                },
              color:Colors.cyan,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      )
    );
  }
}