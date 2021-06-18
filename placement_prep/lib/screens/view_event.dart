import 'package:flutter/material.dart';
import 'package:placement_prep/screens/event.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
        color: Colors.black,
        ),
        title: Text('Event details',
        style: TextStyle(
        color: Colors.black,),
        )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event.title, style: Theme.of(context).textTheme.headline4,),
            SizedBox(height: 20.0),
            Text(event.jobtitle, style: Theme.of(context).textTheme.headline6,),
            Text(event.dept, style: Theme.of(context).textTheme.headline6,),
            Text(event.description, style: Theme.of(context).textTheme.headline6,)
          ],
        ),
      ),
    );
  }
}