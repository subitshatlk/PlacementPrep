import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:placement_prep/components/action_button.dart';
import 'package:placement_prep/utilities/software_hangman.dart';
import 'game_screen_software.dart';
import 'loading_screen.dart';

class SoftwareGameHomeScreen extends StatefulWidget {
  final SoftHangmanWords softhangmanWords = SoftHangmanWords();

  @override
  _SoftwareGameHomeScreenState createState() => _SoftwareGameHomeScreenState();
}

class _SoftwareGameHomeScreenState extends State<SoftwareGameHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    widget.softhangmanWords.readWords();
    return Scaffold(
      backgroundColor: Color(0xFF421b9b),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 65.0, 3.0, 8.0),
                  child: Text(
                    'HANGMAN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 3.0),
                  ),
                ),
              ),
              Center(
                child: Container(
              padding: EdgeInsets.all(30.0),
                  child: Image.asset(
                    'images/software.png',
                    height: height * 0.45,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
//                    width: 155,
                        height: 64,
                        child: ActionButton(
                          buttonTitle: 'Start',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SoftGameScreen(
                                  softObject: widget.softhangmanWords,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Container(
//                    width: 155,
                        height: 64,
                        child: ActionButton(
                          buttonTitle: 'High Scores',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
