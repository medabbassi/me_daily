import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:me_daily/Controllers/databasehelper_sms.dart';
import 'package:me_daily/models/sms.dart';

class AddMessageDialog extends StatefulWidget {
  final String appBarTitle;

  final SMS messages;

  AddMessageDialog(this.messages, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddMessageDialogState(this.messages, this.appBarTitle);
  }
}

class AddMessageDialogState extends State<AddMessageDialog> {
  //declaration goes here
  DateTime _today;
  DateTime _dueDate;

  // notifications goes here
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _dueDate = null;
    initializing();
  }

  void initializing() async {
    androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void _showNotifications() async {
    await notification();
  }

  void _showNotificationsAfterSecond() async {
    await notificationAfterSec();
  }

  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel ID', 'Channel title', 'channel body',
            priority: Priority.High,
            importance: Importance.Max,
            ticker: 'test');
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0,
        'Votre message est enregistré avec succées',
        'clickez ici ',
        notificationDetails);
  }

  Future<void> notificationAfterSec() async {
    var timeDelayed = DateTime.now().add(Duration(seconds: 5));
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'second channel ID', 'second Channel title', 'second channel body',
        priority: Priority.High,
        importance: Importance.Max,
        ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
    NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(
        1, 'Votre message est enregistré avec succées',
        'clickez ici ', timeDelayed, notificationDetails);
  }

  // ignore: missing_return
  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }

    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }

  //static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  SMS message;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddMessageDialogState(this.message, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme
        .title;

    titleController.text = message.title;
    descriptionController.text = message.description;

    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Ajoute un sms"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[

                // First element
                // ListTile(
                //   title: DropdownButton(
                // 	    items: _priorities.map((String dropDownStringItem) {
                // 	    	return DropdownMenuItem<String> (
                // 			    value: dropDownStringItem,
                // 			    child: Text(dropDownStringItem),
                // 		    );
                // 	    }).toList(),

                // 	    style: textStyle,

                // 	    value: getPriorityAsString(todo.priority),

                // 	    onChanged: (valueSelectedByUser) {
                // 	    	setState(() {
                // 	    	  debugPrint('User selected $valueSelectedByUser');
                // 	    	  updatePriorityAsInt(valueSelectedByUser);
                // 	    	});
                // 	    }
                //   ),
                // ),

                // Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Recipient',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                // Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                      updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                //select sending time
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Choisire le temps pour envoyer ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            fontFamily: 'Roboto'
                        ),
                      ),
                      SizedBox(width: 5.0),
                      IconButton(
                        icon: Icon(
                          Feather.calendar,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                        onPressed: () async {
                          final DateTime due = await showDatePicker(
                            context: context,
                            initialDate: _today,
                            firstDate: DateTime(
                                _today.year,
                                _today.month,
                                _today.day
                            ),
                            lastDate: DateTime(_today.year + 2, 12, 31),
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData.light(),
                                child: child,

                              );
                            },
                          );
                          if (due != null) {
                            final TimeOfDay time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: TimeOfDay
                                    .now()
                                    .hour + 1,
                                minute: 00,
                              ),
                            );
                            if (time != null) {
                              setState(() {
                                _dueDate =
                                    DateTime(due.year, due.month, due.day,
                                        time.hour, time.minute);
                              });
                            } else {
                              setState(() {
                                _dueDate =
                                    DateTime(due.year, due.month, due.day);
                              });
                            }
                          }
                        },

                      )
                    ],
                  ),

                ),
                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.greenAccent,
                          textColor: Colors.white,
                          child: Text(
                            'Enregistrer',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            _showNotificationsAfterSecond();
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),

                      Container(width: 5.0,),

                      Expanded(
                        child: RaisedButton(
                          color: Colors.greenAccent,
                          textColor: Colors.white,
                          child: Text(
                            'Supprimer',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),

        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  // void updatePriorityAsInt(String value) {
  // 	switch (value) {
  // 		case 'High':
  // 			todo.priority = 1;
  // 			break;
  // 		case 'Low':
  // 			todo.priority = 2;
  // 			break;
  // 	}
  // }

  // Convert int priority to String priority and display it to user in DropDown
  // String getPriorityAsString(int value) {
  // 	String priority;
  // 	switch (value) {
  // 		case 1:
  // 			priority = _priorities[0];  // 'High'
  // 			break;
  // 		case 2:
  // 			priority = _priorities[1];  // 'Low'
  // 			break;
  // 	}
  // 	return priority;
  // }

  // Update the title of todo object
  void updateTitle() {
    message.title = titleController.text;
  }

  // Update the description of todo object
  void updateDescription() {
    message.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();
    message.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (message.id != null) { // Case 1: Update operation
      result = await helper.updateTodo(message);
    } else { // Case 2: Insert Operation
      result = await helper.insertTodo(message);
    }

    if (result != 0) { // Success
      _showAlertDialog('Status', 'Todo Saved Successfully');
    } else { // Failure
      _showAlertDialog('Status', 'Problem Saving Todo');
    }
  }


  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW todo i.e. he has come to
    // the detail page by pressing the FAB of todoList page.
    if (message.id == null) {
      _showAlertDialog('Status', 'No Todo was deleted');
      return;
    }

    // Case 2: User is trying to delete the old todo that already has a valid ID.
    int result = await helper.deleteTodo(message.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Todo Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Todo');
    }
  }

  void _showAlertDialog(String title, String messages) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(messages),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}










