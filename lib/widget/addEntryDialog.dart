import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/models/activity.dart';
import 'package:me_daily/module/dailyMenu.dart';

class AddEntryDialog extends StatefulWidget {
  final String appBarTitle;
  final Activity activity;

  AddEntryDialog(this.activity, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddEntryDialogState(this.activity, this.appBarTitle);
  }
}

class AddEntryDialogState extends State<AddEntryDialog> {
  //notifications goes here
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

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
        0, 'Activité sera Enregistré', 'please subscribe my channel',
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
  Activity activity;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime _today;
  DateTime _dueDate;

  //dropDownMenu(ebni drop downMenu Hnaaaaa !!!)
  List<DailyMenu> daily = DailyMenu.getMenu();
  List<DropdownMenuItem<DailyMenu>> _dropdownmenu;
  DailyMenu _selectedMenu;

  List<DropdownMenuItem<DailyMenu>> buildDropdownMenuItems(List dailymenu) {
    List<DropdownMenuItem<DailyMenu>> items = List();
    for (DailyMenu daily in dailymenu) {
      items.add(
        DropdownMenuItem(
          value: daily,
          child: Text(daily.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(DailyMenu selectedMenu) {
    setState(() {
      _selectedMenu = selectedMenu;
    });
  }

  // t7bs hna
  AddEntryDialogState(this.activity, this.appBarTitle);

  @override
  void initState() {
    super.initState();
    _dropdownmenu = buildDropdownMenuItems(daily);
    _selectedMenu = _dropdownmenu[0].value;
    _today = DateTime.now();
    _dueDate = null;
    initializing();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;

    titleController.text = activity.title;
    descriptionController.text = activity.description;

    return WillPopScope(

      // ignore: missing_return
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text("Ajoute une activité"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
            backgroundColor: Colors.green,
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[


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
                        labelText: 'Titre d' 'activité',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
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
                        hintText: 'Description d''activité',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                                  updateReminder();
                                });
                              }
                            }
                          },

                        ), Text(
                            ""
                        ),
                        Row(
                          children: <Widget>[
                            DropdownButton(
                              value: _selectedMenu,
                              items: _dropdownmenu,
                              onChanged: onChangeDropdownItem,

                            )
                          ],
                        )
                      ],
                    )

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
                            'enregistrer',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            _showNotifications();
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
                            'supprimer',
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


  void updateTitle() {
    activity.title = titleController.text;
  }


  void updateDescription() {
    activity.description = descriptionController.text;
  }

  void updateReminder() {
    activity.date = _dueDate.toString();
    print(_dueDate.toString());
  }

  void updateDropDown() {
    activity.repeat = _selectedMenu.name;
    print(_selectedMenu.name);
  }

  /*void updateRepeat(){
    activity.repeat=dropdownValue;
 }*/


  void _save() async {
    moveToLastScreen();
    //activity.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (activity.id != null) { // Case 1: Update operation
      result = await helper.updateTodo(activity);
    } else { // Case 2: Insert Operation
      result = await helper.insertTodo(activity);
    }

    if (result != 0) { // Success
      _showAlertDialog('Status', ' cliquez pour fermer');
    } else { // Failure
      _showAlertDialog('Status', 'une erreur s\'est produite réessayer');
    }
  }


  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW todo i.e. he has come to
    // the detail page by pressing the FAB of todoList page.
    if (activity.id == null) {
      _showAlertDialog('Status', 'No Todo was deleted');
      return;
    }

    // Case 2: User is trying to delete the old todo that already has a valid ID.
    int result = await helper.deleteTodo(activity.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Todo Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Todo');
    }
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

}










