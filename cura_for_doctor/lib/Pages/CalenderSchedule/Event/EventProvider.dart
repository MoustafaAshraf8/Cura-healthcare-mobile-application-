import 'package:cura_for_doctor/Pages/CalenderSchedule/Event/Event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventProvider extends ChangeNotifier {
  // final List<Event> _events = [];
  List<Event> _events = [];

  List<Event> get events => _events;

  // List<Event> getEvents() => this._events;

  void setEvents(List<Event> events) {
    this._events = events;
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get SelectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  // List<Event> get eventsOfSelectedDate => _events;
  List<Event> eventsOfSelectedDate(DateTime selectedDate) {
    List<Event> result = [];
    this._events.forEach((e) {
      if (selectedDate.year == e.from.year &&
          selectedDate.month == e.from.month &&
          selectedDate.day == e.from.day) {
        result.add(e);
      }
    });
    return result;
  }
  // List<Event> get eventsOfSelectedDate => {
  //   List<Event> events = [];
  //   this._events.map((event)=>{
  //     if(event.)
  //   })
  // };

  void addEvent(Event event) {
    this._events.add(event);
    print("000000000000000");
    notifyListeners();
  }
}
