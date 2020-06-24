import 'dart:async';
import 'dart:math' as math;

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/Controllers/databasehelper_email.dart';
import 'package:me_daily/models/email.dart';
import 'package:me_daily/widget/AddEmailDialog.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:sqflite/sqflite.dart';

class EmailList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailListState();
  }
}

class EmailListState extends State<EmailList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Email> emailList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (emailList == null) {
      emailList = List<Email>();
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
      icon: Icons.message,
      gradientColors: [secondColor, firstColor],
      onPressed: () {
        debugPrint('FAB clicked');
        navigateToDetail(Email('', ''), 'Ajoute un email');
      },
      background: null,
    );
  }

  ListView getTodoListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return AnimatedCard(
          direction: AnimatedCardDirection.bottom,
          initDelay: Duration(milliseconds: 0),
          duration: Duration(seconds: 1),
          onRemove: () => count,
          curve: Curves.bounceInOut,
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
                    backgroundColor: Colors.amber,
                    child: Text(getFirstLetter(this.emailList[position].title),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  title: Text(this.emailList[position].title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(this.emailList[position].description),
                      SizedBox(height: 6.0),
                      Text(TimeOfDay.now().toString())
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
                          _delete(context, emailList[position]);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    debugPrint("ListTile Tapped");
                    print(emailList[position]);
                    navigateToDetail(
                        this.emailList[position], 'Modifier email');
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

  void _delete(BuildContext context, Email todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String messages) {
    final snackBar = SnackBar(content: Text(messages));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Email email, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddEmailDialog(email, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Email>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((emailList) {
        setState(() {
          this.emailList = emailList;
          this.count = emailList.length;
        });
      });
    });
  }


}
