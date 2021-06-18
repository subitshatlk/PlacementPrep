import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:placement_prep/screens/getotherdetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:placement_prep/models/userdetail.dart';


FirebaseUser loggedInUser;
class HomeScreen extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String userMail = " ";
  FlutterLocalNotificationsPlugin fltrNotification;
  String task;
  String _selectedParam;
  int timerval;
  bool _visible= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser_details();
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var iOSinitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(androidInitialize, iOSinitialize);
    fltrNotification=new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings, onSelectNotification: notificationSelected);
  }
  Future _showNotification() async
  {
    var androidDetails = new AndroidNotificationDetails("Channel ID","Placement Prep","Placement preparation mobile application",importance: Importance.Max);
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(androidDetails, iOSDetails);
    //await fltrNotification.show(0,"Task","You created a Task",generalNotificationDetails,payload:"Task" );
    var scheduledTime;
    if(_selectedParam == "Hour"){
    scheduledTime= DateTime.now().add(Duration(hours : timerval));
    }else if(_selectedParam == " Minute"){
      scheduledTime= DateTime.now().add(Duration(minutes : timerval));
    }else{
  scheduledTime= DateTime.now().add(Duration(seconds : timerval));
  }

    fltrNotification.schedule(1, "Remainder !!", task, scheduledTime, generalNotificationDetails);

  }

  void getuser_details() async{
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user as FirebaseUser;
      userMail=loggedInUser.email;
    }
  }
  @override
  Widget build(BuildContext context) {
    final newUser = new Userdetails(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        title: Text(
          'Alerts and Announcements',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),

      ),
      body: StreamBuilder(
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection("events").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      data['title'],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    children: <Widget>[

                      //ListTile(
                      InkWell(
                          child: Text('Register :' + data['link'],
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w700),
                          ),

                          onTap: () async {
                            if (await canLaunch(data['link'])) {
                              await launch(data['link']);
                            }
                          }
                      ),

                      ListTile(
                        title: Text('Job Title : ' +
                            data['jobtitle'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ), ListTile(
                        title: Text('Eligible Departments : ' +
                            data['dept'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),

                      ListTile(
                        title: Text('More Information : ' +
                            data['description'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            SizedBox(height: 25.0,),
                            //Text("Set Alarm ?"),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _visible = !_visible;
                                });
                              },
                              color: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Set Alarm !",),
                            ),
                            SizedBox(height: 10.0,),
                            Visibility(
                              visible: _visible,
                              child: Padding(padding: const EdgeInsets.all(1.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter the remainder task",),
                                  onChanged: (_val) {
                                    task = _val;
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _visible,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: <Widget>[
                                  DropdownButton(
                                    value: _selectedParam,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Seconds"),
                                        value: "Seconds",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Minutes"),
                                        value: "Minutes",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Hours"),
                                        value: "Hours",
                                      ),
                                    ],
                                    hint: Text(
                                      "Select Time",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onChanged: (_val) {
                                      setState(() {
                                        _selectedParam = _val;
                                      });
                                    },
                                  ),
                                  DropdownButton<int>(
                                    value: timerval,
                                    items: [
                                      DropdownMenuItem<int>(
                                        child: Text("1"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("2"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("3"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("4"),
                                        value: 4,
                                      ),
                                      DropdownMenuItem<int>(
                                        child: Text("5"),
                                        value: 5,
                                      ),
                                    ],
                                    hint: Text(
                                      "Select duration",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onChanged: (_val) {
                                      setState(() {
                                        timerval = _val;
                                      });
                                    },
                                    elevation: 10,

                                  ),
                                ],
                              ),
                            ),
                            // ignore: deprecated_member_use
                            Visibility(
                              visible: _visible,
                              child: RaisedButton(
                                onPressed: _showNotification,
                                color: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Notify Me !"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }else{
            return Center(child: Text('Loading ...'));
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:
              Center(
                child: Text('Hello '+ userMail,style: TextStyle(
                  fontSize:20.0,
                ),),
              ),

            ),
            ListTile(
              leading: Icon(Icons.add),
                title: Text('Profile', style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,

                ),),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Getotherdetails(userdetails: newUser,)),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.person_outline_rounded),
                title: Text('My Profile',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context,'Displayuserdetails');
                }
            ),
            ListTile(
                leading: Icon(Icons.rate_review_outlined),
                title: Text('Alumni Reviews',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'Alumnireview');
                }
            ),
            ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: Text('Machine Learning',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              ),

            onTap: () {
              Navigator.pushNamed(context, 'topics1');
            }
          ),
            ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: Text('Software Development',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'topics2');
                }
            ),
            ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: Text('IOT',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'topics3');
                }
            ),
            ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                title: Text('Calendar',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'calendar2');
                }
            ),
            ListTile(
                leading: Icon(Icons.psychology_outlined),
                title: Text('Quiz',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'splash');
                }
            ),
            ListTile(
                leading: Icon(Icons.gamepad_outlined),
                title: Text('ML Game',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'gamePage');
                }
            ),
            ListTile(
                leading: Icon(Icons.gamepad_outlined),
                title: Text('IOT Game',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'gamePage1');
                }
            ),
            ListTile(
                leading: Icon(Icons.gamepad_outlined),
                title: Text('S/W Dev Game',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'gamePage2');
                }
            ),
            ListTile(
                leading: Icon(Icons.insert_chart_outlined),
                title: Text('Latest Technologies',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'technology');
                }
            ),
            ListTile(
                leading: Icon(Icons.question_answer_sharp),
                title: Text('Chatbot',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'Chatbot');
                }
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Architects',

              ),),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, 'signupview', (route) => false);
              },
            ),

          ],
        ),
      ),
    );
  }

  Future notificationSelected (String payload) async {
    showDialog(context: context,
    builder : (context) => AlertDialog(
      content : Text(" To Do : $task"),
    ),
    );
  }
}
