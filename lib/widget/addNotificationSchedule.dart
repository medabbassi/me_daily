import 'dart:core';

import 'package:flutter/material.dart';

class AddNotificationSchedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotificationScheduleState();
  }
}

class AddNotificationScheduleState extends State<AddNotificationSchedule> {
  String getTime(TimeOfDay d) =>
      "${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(
          2, '0')}";
  TimeOfDay timeSelected;
  var x = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Add a notification"),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {},
              child: new Text(
                'SAVE',
                style: Theme
                    .of(context)
                    .textTheme
                    .subhead
                    .copyWith(
                    color: Colors.white
                ),
              )),

        ],
      ),
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(

                onPressed: null,
                child: Text(
                  'Select from Calender',
                  style: Theme
                      .of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                )),
            SizedBox(height: 10.0),
            new ListTile(
              leading: TextField(
                decoration: InputDecoration(
                  hintText: 'walk the dog',
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
