import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';


// class datenowTime {
//   Future<void> toDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2021),
//       lastDate: DateTime(2030),
//     );
//   }
// }
EventList<Event> _getMarkedDateMap(List<DateTime> days, BuildContext context){
  EventList<Event> _markedDateMap=new EventList<Event>(events: {});
  for (DateTime _date in days){
    _markedDateMap.add(_date,
        new Event(
          date: _date,
          icon: _getIcon(_date), //アイコンを作成
        ));
  }
  return _markedDateMap;
}
