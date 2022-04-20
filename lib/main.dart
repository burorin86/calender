import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';
// import 'calender.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _getIcon(DateTime date){

    bool _isToday=isSameDay(date, DateTime.now());//今日？
    CalendarCarousel _calendar_default=CalendarCarousel();
    Color _today_col=_calendar_default.todayButtonColor;  //今日の背景色

    return Container(
    decoration: new BoxDecoration(
    color: _isToday ? _today_col :Theme.of(context).scaffoldBackgroundColor,
    borderRadius: BorderRadius.circular(1000),
    ), //今日の場合は赤の円の背景　それ以外は無し
    child: Column(
    children: [
    Text(
    date.day.toString(),
    style: TextStyle(
    color: _isToday? Colors.white: getDayCol(date),
    fontWeight: FontWeight.w400
    ),//日付の文字　今日は白、それ以外は平日黒、休日赤
    ),
    SizedBox(height: 2,),
    Icon(
    Icons.brightness_1,
    color: Colors.blue,
    size: 16,
    ), //日付と一緒に表示するアイコン
    ]
    )

    );
  }
  static bool isSameDay(DateTime day1, DateTime day2) {
    return ((day1.difference(day2).inDays) == 0 && (day1.day == day2.day));
  }
  Color getDayCol(DateTime _date){
    switch(_date.weekday){
      case DateTime.saturday:
      case DateTime.sunday:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
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

  // int _counter = 0;
  // DateTime _date = new DateTime.now();
  //  _dataTime() async {
  //    final newDate = await showDatePicker(
  //       context: context,
  //       initialDate: _date,
  //       firstDate: DateTime(DateTime.now().year - 2),
  //       lastDate: DateTime(DateTime.now().year + 2),
  //   );
  //    print(_date);
  // }
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  //
  // void _calendar(BuildContext context){
  //   final DateTime = showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime(2030),
  //   );
  // }
  //
  // Future<void> _toDate(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime(2030),
  //   );
    // if (selected != null) {
    //   setState(() {
    //     _labelText = (DateFormat.yMMMd()).format(selected);
    //   });
    // }
  // }
  @override
  Widget build(BuildContext context) {
    List<DateTime> _days=[DateTime(2020, 12, 20), DateTime(2020, 12, 21)];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
              margin: const EdgeInsets.only(top:20, left:20),
              //ここから
              child: CalendarCarousel<Event>(
                //アイコンを表示する日付について、EventのList
                markedDatesMap: _getMarkedDateMap(_days, context),
                markedDateShowIcon: true,
                markedDateIconMaxShown: 1,
                markedDateMoreShowTotal: null,
                markedDateIconBuilder: (event)=>event.icon,  //アイコン
              ),
            )
          // mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[
             // IconButton(
             //  onPressed: (){
             //    datenowTime().toDate(context);
             //  },
            //   icon: Icon(Icons.date_range),
            // ),
            // TableCalendar(
            //   focusedDay: DateTime.now(),
            //     firstDay: DateTime(2020),
            //     lastDay: DateTime(2023),
            // )
          // ],
        ),
      );
  }
}
