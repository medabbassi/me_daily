import 'package:flutter/material.dart';

class MakeActivity extends StatelessWidget {
  final List<String> _listViewData = [
    "A List View with many Text - Here's one!",
    "A List View with many Text - Here's another!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 7.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                DropdownButton(
                  isExpanded: false,
                  onChanged: (item) => print('changed:$item'),
                  items: [
                    DropdownMenuItem(
                      child: Text('Monday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Tuesday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Wednesday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Thursday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Friday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Saturday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Sunday'),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.grey,
                  onPressed: () {
                    print('print 0');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.grey,
                  onPressed: () {
                    print('print1');
                  },
                ),
                DropdownButton(
                  isExpanded: false,
                  onChanged: (item) => print('changed:$item'),
                  items: [
                    DropdownMenuItem(
                      child: Text('Monday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Tuesday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Wednesday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Thursday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Friday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Saturday'),
                    ),
                    DropdownMenuItem(
                      child: Text('Sunday'),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(5.0),
                children: _listViewData.reversed.map((data) {
                  return ListTile(
                    title: Text(data),
                  );
                }).toList(),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
              },
              child: Text(
                "Flat Button",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
