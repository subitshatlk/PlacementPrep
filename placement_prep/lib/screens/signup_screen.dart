import 'package:flutter/material.dart';
import 'package:placement_prep/screens/getuserdetails.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'home_screen.dart';
import 'package:placement_prep/models/userdetail.dart';
import 'login_screen.dart';
enum AuthFormType{signIn,signUp}
class SignupScreen extends StatefulWidget {
  final AuthFormType authFormType;
  SignupScreen({Key key, @required this.authFormType}):super();
  @override
  _SignupScreenState createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen>
{
  AuthFormType authFormType;
  _SignupScreenState({this.authFormType});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = new TextEditingController();
  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void switchFormState(String state){
    _formKey.currentState.reset();
    if(state == "signUp")
      {
        setState(() {
          authFormType=AuthFormType.signUp;
        });
      } else{
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  void _showErrorDialog(String msg)
  {
    showDialog(
        context : context,
        builder: (ctx) => AlertDialog(
          title:Text('An Error Occurred.'),
          content:Text(msg),
          actions: <Widget>[
            FlatButton(
              child:Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async
  {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      final auth = Provider.of(context).auth;
      if (authFormType == AuthFormType.signIn) {
        await Provider.of<Authentication>(context, listen: false).signUp(
            _authData['email'],
            _authData['password']
        );
        String uid = await auth.signInWithEmailAndPassword(
            _authData['email'], _authData['password']);
        print("Signed in with $uid");
        Navigator.of(context).restorablePushReplacementNamed('HomeScreen');
      }
    else{
      String uid = await auth.creeateUserWithEmailandPassword(_authData['email'], _authData['password']);
      print("Signed in with NEW ID $uid");
      Navigator.of(context).pushReplacementNamed('HomeScreen');
    }
    }
      catch (error) {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final newUser = new Userdetails(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
          title: Text('Signup'),
          toolbarHeight: 70.0,
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add),
                onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Getuserdetails(userdetails: newUser,)),
              );
              },
            ),

            FlatButton(
              child: Row(
                children: <Widget>[
                  Text('Login'),
                  Icon(Icons.person)

                ],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
            )
          ]
      ),

      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green,
                      Colors.blue,
                    ]
                )
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 400,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                            {
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email'] = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                            {
                              return 'Please enter a password of minimum 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password'] = value;
                          },
                        ),
                        //Confirm Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'Please enter a password of minimum 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                          },
                        ),
                        SizedBox(
                            height: 30
                        ),
                        RaisedButton(
                          child: Text(
                              'Submit'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}