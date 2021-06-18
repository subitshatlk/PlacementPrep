import 'package:firebase_helpers/firebase_helpers.dart';

// ignore: deprecated_member_use
class EventModel extends DatabaseItem{
  final String id;
  final String title;
  final String link;
  final String jobtitle;
  final String dept;
  final String description;
  final DateTime eventDate;

  EventModel({this.id,this.title, this.description, this.eventDate, this.jobtitle, this.dept, this.link}) : super('');

  factory EventModel.fromMap(Map data) {
    return EventModel(
      title: data['title'],
      link: data['link'],
      jobtitle: data['jobtitle'],
      dept: data['dept'],
      description: data['description'],
      eventDate: data['event_date'],
    );
  }

  factory EventModel.fromDS(String id, Map<String,dynamic> data) {
    return EventModel(
      id: id,
      title: data['title'],
      link: data['link'],
      jobtitle: data['jobtitle'],
      dept: data['dept'],
      description: data['description'],
      eventDate: data['event_date']?.toDate(),
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "title":title,
      "link":link,
      "jobtitle":jobtitle,
      "dept":dept,
      "description": description,
      "event_date": eventDate,
      "id":id,
    };
  }
}