import 'package:flutter/material.dart';
import 'package:placement_prep/screens/gamehome_screen.dart';
import 'package:placement_prep/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Topic2 extends StatefulWidget {
  Topic2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Topic2State createState() => _Topic2State();
}

class _Topic2State extends State<Topic2> {


  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
  bool check8 = false;
  bool check9 = false;
  bool check10 = false;
  bool check11 = false;
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;
  bool _checkboxValue5= false;
  bool _checkboxValue6 = false;
  bool _checkboxValue7= false;
  bool _checkboxValue8 = false;
  bool _checkboxValue9 = false;
  bool _checkboxValue10= false;
  bool _checkboxValue11 = false;




  void initState() {
    super.initState();

    _loadswitchValue();
  }


  _loadswitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      check1 = (prefs.getBool('Arrays')) ?? false;
      check2 = (prefs.getBool('Searching and sorting')) ?? false;
      check3 = (prefs.getBool('Strings')) ?? false;
      check4 = (prefs.getBool('Hashing')) ?? false;
      check5 = (prefs.getBool('Linked List')) ?? false;
      check6 = (prefs.getBool('Stack')) ?? false;
      check7 = (prefs.getBool('Queue')) ?? false;
      check8 = (prefs.getBool('Tree and BST')) ?? false;
      check9 = (prefs.getBool('Heap')) ?? false;
      check10 = (prefs.getBool('Backtracking')) ?? false;
      check11 = (prefs.getBool('Dynamic Programming')) ?? false;
      _checkboxValue1 = (prefs.getBool('1')) ?? false;
      _checkboxValue2 = (prefs.getBool('2')) ?? false;
      _checkboxValue3 = (prefs.getBool('3')) ?? false;
      _checkboxValue4 = (prefs.getBool('4')) ?? false;
      _checkboxValue5 = (prefs.getBool('5')) ?? false;
      _checkboxValue6 = (prefs.getBool('6')) ?? false;
      _checkboxValue7 = (prefs.getBool('7')) ?? false;
      _checkboxValue8 = (prefs.getBool('8')) ?? false;
      _checkboxValue9 = (prefs.getBool('9')) ?? false;
      _checkboxValue10 = (prefs.getBool('10')) ?? false;
      _checkboxValue11= (prefs.getBool('11')) ?? false;

    });
  }

  _savenswitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      prefs.setBool('1', _checkboxValue1);
      prefs.setBool('2', _checkboxValue2);
      prefs.setBool('3', _checkboxValue3);
      prefs.setBool('4', _checkboxValue4);
      prefs.setBool('5', _checkboxValue5);
      prefs.setBool('6', _checkboxValue6);
      prefs.setBool('7', _checkboxValue7);
      prefs.setBool('8', _checkboxValue8);
      prefs.setBool('9', _checkboxValue6);
      prefs.setBool('10', _checkboxValue7);
      prefs.setBool('11', _checkboxValue8);
      prefs.setBool('abc', check1);
      prefs.setBool('abcd', check2);
      prefs.setBool('abcde', check3);
      prefs.setBool('abcdef', check4);
      prefs.setBool('abcdefg', check5);
      prefs.setBool('abcdefgh', check6);
      prefs.setBool('abcdefghi', check7);
      prefs.setBool('abcdefghij', check8);
      prefs.setBool('abcdefghijk', check9);
      prefs.setBool('abcdefghijkl', check10);
      prefs.setBool('abcdefghijhklm', check11);

    });
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("To Do list - Software Development"),
        backgroundColor: Colors.indigo,
      ),

      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue1,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue1 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Arrays",style: TextStyle(fontSize: 17.0)),


                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue2,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue2 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Searching and Sorting",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue3,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue3 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Strings",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue4,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue4 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Hashing",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue5,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue5 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Linked List",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue6,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue6 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Stack",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue7,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue7 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Queue",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue8,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue8 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Tree and BST",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue9,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue9 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Heap",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue10,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue10 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Backtracking",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Checkbox(
                            value: _checkboxValue11,
                            onChanged: (bool value) {
                              setState(() {
                                _checkboxValue11 = value;

                                _savenswitchValue();
                              });
                            }
                        ),
                        Text("Dynamic Programming",style: TextStyle(fontSize: 17.0)),
                      ]
                  ),
                ),
                SizedBox(height:40,),



                FlatButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>splashscreen()));
                  },
                  child: Text('Take Quiz'),
                ),


                SizedBox(height:20,),
                FlatButton(

                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GameHomeScreen()));
                  },
                  child: Text('Play A Game '),

                ),

              ],

            ),
          ),
        ),
      ),



    );

  }



}