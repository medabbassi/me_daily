import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:me_daily/Controllers/databasehelper_email.dart';
import 'package:me_daily/models/email.dart';

class AddEmailDialog extends StatefulWidget {
  final String appBarTitle;

  final Email email;

  AddEmailDialog(this.email, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddEmailDialogState(this.email, this.appBarTitle);
  }
}

class AddEmailDialogState extends State<AddEmailDialog> {
  //notifications goes here
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initState() {
    super.initState();
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
        0, 'Hello there', 'please subscribe my channel', notificationDetails);
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
    await flutterLocalNotificationsPlugin.schedule(1, 'Hello there',
        'please subscribe my channel', timeDelayed, notificationDetails);
  }

  // ignore: missing_return
  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }

    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
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

  //Message message;
  Email email;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddEmailDialogState(this.email, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;

    titleController.text = email.title;
    descriptionController.text = email.description;

    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Ajoute un email"),
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
                        labelText: 'Title',
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
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
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
    email.title = titleController.text;
  }

  // Update the description of todo object
  void updateDescription() {
    email.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();
    email.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (email.id != null) { // Case 1: Update operation
      result = await helper.updateTodo(email);
    } else { // Case 2: Insert Operation
      result = await helper.insertTodo(email);
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
    if (email.id == null) {
      _showAlertDialog('Status', 'No Todo was deleted');
      return;
    }

    // Case 2: User is trying to delete the old todo that already has a valid ID.
    int result = await helper.deleteTodo(email.id);
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










