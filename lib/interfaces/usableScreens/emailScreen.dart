import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmailListState();
  }
}

class _EmailListState extends State<EmailList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getTodoListView(),
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
