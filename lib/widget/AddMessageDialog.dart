import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMessageDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddMessageDialogState();
  }
}

class AddMessageDialogState extends State<AddMessageDialog> {
  DateTime _dateTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Add Message'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {},
            child: new Text(
              'SAVE',
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8.0),
          new ListTile(
              leading: new Icon(Icons.contact_phone),
              title: TextField(
                decoration: InputDecoration(hintText: "Recipient phone Number"),
              )),
          SizedBox(height: 8.0),
          new ListTile(
              leading: new Icon(Icons.create), title: _buildTextField()),
          SizedBox(height: 8.0),
          new ListTile(
            leading: new Icon(Icons.today),
            title: Text(
              'Schedule to Sent',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.0),
            ),
            subtitle: new DateTimeItem(
                dateTime: _dateTime,
                onChanged: (dateTime) => setState(() => _dateTime = dateTime)),
          )
        ],
      ),
    );
  }
}

Widget _buildTextField() {
  final maxLines = 6;

  return Container(
    margin: EdgeInsets.all(10),
    height: maxLines * 24.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.white70,
        filled: true,
      ),
    ),
  );
}

class DateTimeItem extends StatelessWidget {
  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? new DateTime.now()
            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text('$time')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(const Duration(days: 20000)),
        lastDate: new DateTime.now());

    if (dateTimePicked != null) {
      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
        await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(new DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}
