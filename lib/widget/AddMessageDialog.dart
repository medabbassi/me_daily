import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:me_daily/Controllers/databasehelper_sms.dart';
import 'package:me_daily/models/message.dart';

class AddMessageDialog extends StatefulWidget {
  final String appBarTitle;

  final Message message;

  AddMessageDialog(this.message, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddMessageDialogState(this.message, this.appBarTitle);
  }
}

class AddMessageDialogState extends State<AddMessageDialog> {

  //static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Message message;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddMessageDialogState(this.message, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
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










