import 'dart:async';
import 'dart:math' as math;

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/models/activity.dart';
import 'package:me_daily/widget/addEntryDialog.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:sqflite/sqflite.dart';

class ActivityList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityListState();
  }
}

class ActivityListState extends State<ActivityList> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Activity> activityList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (activityList == null) {
      activityList = List<Activity>();
      updateListView();
    }

    return Scaffold(
      body: getTodoListView(),
      floatingActionButton: AddButton(),
      /* FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Activity('',''), 'Add Todo');
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),*/
    );
  }

  Widget AddButton() {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

    return NiceButton(
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: "Ajoute",
      icon: Icons.accessibility,
      gradientColors: [secondColor, firstColor],
      onPressed: () {
        debugPrint('FAB clicked');
        navigateToDetail(Activity('', ''), 'Ajoute une activité');
      },
      background: null,
    );
  }

  ListView getTodoListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return AnimatedCard(
          direction: AnimatedCardDirection.left,
          //Initial animation direction
          initDelay: Duration(milliseconds: 0),
          //Delay to initial animation
          duration: Duration(seconds: 1),
          onRemove: () {
            _delete(context, activityList[position]);
          },
          curve: Curves.easeInOutBack,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    child: Text(
                        getFirstLetter(this.activityList[position].title),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  title: Text(this.activityList[position].title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(this.activityList[position].description),
                      SizedBox(height: 6),
                      Text(this.activityList[position].date)
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onTap: () {
                          _delete(context, activityList[position]);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    debugPrint("ListTile Tapped");
                    print(activityList[position]);
                    navigateToDetail(
                        this.activityList[position], 'Modifier l' 'activité');
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Returns the priority color
  // Color getPriorityColor(int priority) {
  // 	switch (priority) {
  // 		case 1:
  // 			return Colors.red;
  // 			break;
  // 		case 2:
  // 			return Colors.yellow;
  // 			break;

  // 		default:
  // 			return Colors.yellow;
  // 	}
  // }
  getFirstLetter(String title) {
    return title.substring(0, 2);
  }

  // Returns the priority icon
  // Icon getPriorityIcon(int priority) {
  // 	switch (priority) {
  // 		case 1:
  // 			return Icon(Icons.play_arrow);
  // 			break;
  // 		case 2:
  // 			return Icon(Icons.keyboard_arrow_right);
  // 			break;

  // 		default:
  // 			return Icon(Icons.keyboard_arrow_right);
  // 	}
  // }

  void _delete(BuildContext context, Activity todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Activity activity, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddEntryDialog(activity, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Activity>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((activityList) {
        setState(() {
          this.activityList = activityList;
          this.count = activityList.length;
        });
      });
    });
  }
}
