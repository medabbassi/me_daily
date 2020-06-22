import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/models/activity.dart';
import 'package:me_daily/widget/addEntryDialog.dart';
import 'package:nice_button/nice_button.dart';
import 'package:sqflite/sqflite.dart';

class ActivityList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActivityListState();
  }
}

class _ActivityListState extends State<ActivityList> {
  int count = 0;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Activity> activityList;

  @override
  Widget build(BuildContext context) {
    if (activityList == null) {
      activityList = List<Activity>();
      updateListView();
    }
    // TODO: implement build
    return Scaffold(
      body: getTodoListView(),
      floatingActionButton: AddButton(),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      // ignore: non_constant_identifier_names
      Future<List<Activity>> ActivityListFuture = databaseHelper.getTodoList();
      ActivityListFuture.then((activityList) {
        setState(() {
          this.activityList = activityList;
          this.count = activityList.length;
        });
      });
    });
  }

  // ignore: non_constant_identifier_names
  Widget AddButton() {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

    return NiceButton(
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: "Ajoute",
      icon: Icons.accessibility,
      gradientColors: [secondColor, firstColor],
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new AddEntryDialog();
            },
            fullscreenDialog: true));
      },
      background: null,
    );
  }

  ListView getTodoListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    "hhhh",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              title:
                  Text("hello", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(""),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        print('jhhhh');
                      })
                ],
              ),
              onTap: () {
                debugPrint("ListTile Tapped");
              },
            ),
          );
        });
  }
}
