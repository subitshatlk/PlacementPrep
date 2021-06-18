import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prep/screens/Calendar2.dart';
import 'package:placement_prep/screens/add_event.dart';
import 'package:placement_prep/screens/alumnireview.dart';
import 'package:placement_prep/screens/chatbot.dart';
import 'package:placement_prep/screens/displayuserdetails.dart';
import 'package:placement_prep/screens/gamehome_screen.dart';
import 'package:placement_prep/screens/gamehomeiot_screen.dart';
import 'package:placement_prep/screens/gamehomesoft_screen.dart';
import 'package:placement_prep/screens/getotherdetails.dart';
import 'package:placement_prep/screens/getuserdetails.dart';
import 'package:placement_prep/screens/sign_up_view.dart';
import 'package:placement_prep/screens/topic1.dart';
import 'package:placement_prep/screens/topic2.dart';
import 'package:placement_prep/screens/topic3.dart';
import 'package:placement_prep/screens/welcome.dart';
import 'package:placement_prep/screens/welcome/admin.dart';
import 'package:placement_prep/screens/welcome/admin_home.dart';
import 'package:placement_prep/screens/welcome/admin_login.dart';
import 'package:placement_prep/screens/welcome/alumniform.dart';
import 'package:placement_prep/screens/welcome/navigate.dart';
import 'package:placement_prep/screens/welcome/calendar.dart';
import 'package:placement_prep/screens/welcome/display_data.dart';
import 'package:placement_prep/screens/welcome/technology.dart';
import 'package:placement_prep/splash.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/welcome.dart';
import 'models/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'screens/gamehome_screen.dart';
import 'package:placement_prep/services/auth_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:placement_prep/widgets/provider_widget.dart';
final firestoreInstance = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        auth:AuthService(),
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.greenAccent,

        ),
        home: Welcome(),
        routes: {
          'signupview' : (BuildContext context) => SignUpView(authFormType:AuthFormType.signUp),
          'login_screen': (context) => LoginScreen(),
          'HomeScreen': (ctx) => HomeController(),
          'admin_login': (context) => LoginPage(),
          'admin_home': (context) => AdminNew(),
          //'admin_profile' : (context) => AdminProfile(),
          'technology': (context) => Technology(),
          'display_data': (context) => DisplayData(),
          'welcome': (context) => Welcome(),
          'calendar2': (context) => CalendarPage(),
          'add_event': (context) => AddEventPage(),

          'splash': (context) => splashscreen(),
          'gamePage': (context) => GameHomeScreen(),
          'gamePage1': (context) => IotGameHomeScreen(),
          'gamePage2': (context) => SoftwareGameHomeScreen(),
          'topics1': (context) => Topic1(),
          'topics2': (context) => Topic2(),
          'topics3': (context) => Topic3(),
          'Getuserdetails': (context) => Getuserdetails(),
          'Getotherdetails': (context) => Getotherdetails(),
          'Displayuserdetails': (context) => Displayuserdetails(),
          'Alumnireview': (context) => Alumnireview(),
          'Alumniform': (context) => Alumniform(),
          'Chatbot': (context) => ChatBot(),


        },
      ),
    );
  }
}

class HomeController extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeScreen(): Welcome();
        }
        return CircularProgressIndicator();
      },
    );
  }
  }






