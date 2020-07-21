import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MakeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MakeActivityState();
  }
}

class _MakeActivityState extends State<MakeActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: SfCalendar(),
      ),
    );
  }
}
