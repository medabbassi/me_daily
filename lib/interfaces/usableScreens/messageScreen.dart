import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/widget/AddMessageDialog.dart';
import 'package:nice_button/NiceButton.dart';

class MessageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getTodoListView(),
      floatingActionButton: AddButton(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget AddButton() {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

    return NiceButton(
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: "Ajoute",
      icon: Icons.message,
      gradientColors: [secondColor, firstColor],
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new AddMessageDialog();
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
