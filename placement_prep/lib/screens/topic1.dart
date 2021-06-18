import 'package:flutter/material.dart';
import 'package:placement_prep/screens/gamehome_screen.dart';
import 'package:placement_prep/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Topic1 extends StatefulWidget {
  Topic1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Topic1State createState() => _Topic1State();
}

class _Topic1State extends State<Topic1> {


  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
  bool check8 = false;
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;
  bool _checkboxValue5= false;
  bool _checkboxValue6 = false;
  bool _checkboxValue7= false;
  bool _checkboxValue8 = false;



  void initState() {
    super.initState();

    _loadswitchValue();
  }


  _loadswitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      check1 = (prefs.getBool('Introduction to Machine Learning')) ?? false;
      check2 = (prefs.getBool('Data Preprocessing')) ?? false;
      check3 = (prefs.getBool('Supervised Learning')) ?? false;
      check4 = (prefs.getBool('Feature Engineering')) ?? false;
      check5 = (prefs.getBool('Supervised Learning Classification')) ?? false;
      check6 = (prefs.getBool('Unsupervised Learning')) ?? false;
      check7 = (prefs.getBool('Time Series Modelling')) ?? false;
      check8 = (prefs.getBool('Ensemble Learning')) ?? false;

      _checkboxValue1 = (prefs.getBool('1')) ?? false;
      _checkboxValue2 = (prefs.getBool('2')) ?? false;
      _checkboxValue3 = (prefs.getBool('3')) ?? false;
      _checkboxValue4 = (prefs.getBool('4')) ?? false;
      _checkboxValue5 = (prefs.getBool('5')) ?? false;
      _checkboxValue6 = (prefs.getBool('6')) ?? false;
      _checkboxValue7 = (prefs.getBool('7')) ?? false;
      _checkboxValue8 = (prefs.getBool('8')) ?? false;

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

      prefs.setBool('abc', check1);
      prefs.setBool('abcd', check2);
      prefs.setBool('abcde', check3);
      prefs.setBool('abcdef', check4);
      prefs.setBool('abcdefg', check5);
      prefs.setBool('abcdefgh', check5);
      prefs.setBool('abcdefghi', check6);
      prefs.setBool('abcdefghij', check6);

    });
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("To Do list ML"),
        backgroundColor: Colors.indigo,
      ),


      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
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
                      Text("Introduction to machine learning",style: TextStyle(fontSize: 17.0)),


                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Row(
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
                      Text("Data Preprocessing",style: TextStyle(fontSize: 17.0)),
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
                      Text("Supervised Learning",style: TextStyle(fontSize: 17.0)),
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
                      Text("Feature Engineering",style: TextStyle(fontSize: 17.0)),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Row(

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
                      Text("Supervised Learning Classfication",style: TextStyle(fontSize: 17.0)),
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
                      Text("Unsupervised Learning",style: TextStyle(fontSize: 17.0)),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Row(
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
                      Text("Time Series Modelling",style: TextStyle(fontSize: 17.0)),
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
                      Text("Ensemble Learning",style: TextStyle(fontSize: 17.0)),
                    ]
                ),
              ),
              SizedBox(height:40,),

              // _getPage(check1),

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



    );

  }
}