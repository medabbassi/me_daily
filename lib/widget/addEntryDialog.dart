import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/models/activity.dart';
import 'package:me_daily/module/dailyMenu.dart';
import 'package:meta/meta.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  Activity activity;

  DatabaseHelper helper;

  DateTime _dateTime = new DateTime.now();

  List<DailyMenu> _dailMenus = DailyMenu.getMenu();

  List<DropdownMenuItem<DailyMenu>> _dropDownMenuItems;

  DailyMenu _selectedDailyMenu;

  final TextEditingController _titleController = new TextEditingController();

  final TextEditingController _descriptionController =
      new TextEditingController();

  final String time = '';

  final String nbReapeats = "";

  @override
  void initState() {
    _dropDownMenuItems = buildDropdownMenuItems(_dailMenus);
    _selectedDailyMenu = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<DailyMenu>> buildDropdownMenuItems(List dailyMenus) {
    List<DropdownMenuItem<DailyMenu>> items = List();
    for (DailyMenu dailyMenu in dailyMenus) {
      items.add(
        DropdownMenuItem(
          value: dailyMenu,
          child: Text(dailyMenu.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(DailyMenu selectedCompany) {
    setState(() {
      _selectedDailyMenu = selectedCompany;
    });
  }

  void _save() async {
    moveToLastScreen();

    int result;

    if (activity.id != null) { // Case 1: Update operation
      result = await helper.updateTodo(activity);
    } else { // Case 2: Insert Operation
      result = await helper.insertTodo(activity);
    }
    if (result != 0) { // Success
      _showAlertDialog('Status', 'Todo Saved Successfully');
    } else { // Failure
      _showAlertDialog('Status', 'Problem Saving Todo');
    }
  }

  void updateTitle() {
    activity.title = _titleController.text;
  }

  // Update the description of todo object
  void updateDescription() {
    activity.description = _descriptionController.text;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Add Activity'),
        actions: [
          new FlatButton(
              onPressed: () {
                //TODO: Handle save
                _save();
              },
              child: new Text('SAVE',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white)

              )
          ),
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8.0),
          new ListTile(
            leading: SizedBox(width: 8.0),
            title: TextField(
              controller: _titleController,
              onChanged: (value) {
                debugPrint('Something changed in Title Text Field');
              },
              decoration: InputDecoration(

                hintText: "add title here",

              ),
            ),
          ),
          SizedBox(height: 8.0),
          new ListTile(
              leading: new Icon(Icons.alarm, color: Colors.green),
              title: new DateTimeItem(
                  dateTime: _dateTime,
                  onChanged: (dateTime) => setState(() => _dateTime = dateTime))
          ),
          SizedBox(height: 8.0),
          new ListTile(
            leading: new Icon(Icons.subject, color: Colors.green),
            title: TextField(
              controller: _descriptionController,
              onChanged: (value) {
                debugPrint('Something changed in Title Text Field');
              },
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
          ),
          SizedBox(height: 8.0),

          SizedBox(height: 8.0),
          new ListTile(
            leading: new Icon(Icons.replay, color: Colors.green),
            title: DropdownButton(
              value: _selectedDailyMenu,
              items: _dropDownMenuItems,
              onChanged: onChangeDropdownItem,
            ),

          )
        ],
      ),
    );
  }
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
                child: new Text(
                    new DateFormat('EEEE, MMMM , dd').format(date))),
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