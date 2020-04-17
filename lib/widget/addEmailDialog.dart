import 'package:flutter/material.dart';

class AddEmailDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddEmailDialogState();
  }
}

class AddEmailDialogState extends State<AddEmailDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Add email'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {},
            child: new Text(
              'SAVE',
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8.0),
          new ListTile(
              leading: new Icon(Icons.alternate_email),
              title: _buildTextField())
        ],
      ),
    );
  }
}

Widget _buildTextField() {
  final maxLines = 5;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.grey[300],
        filled: true,
      ),
    ),
  );
}
