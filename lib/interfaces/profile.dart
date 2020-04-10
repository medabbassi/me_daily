import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  String _name, _email, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Colors.orange,
                child: Center(
                  child: Text('Background image goes here'),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 60.0),
                                  Text(
                                    'username goes here'.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 19.0,

                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    'Name'.toUpperCase(),

                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        fontSize: 14.0,
                                        color: Colors.grey
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(

                                    children: <Widget>[
                                      SizedBox(width: 15.0),
                                      Column(

                                        children: <Widget>[

                                          Text(
                                            'email goes here'.toUpperCase(),
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
                                              fontFamily: 'Roboto',
                                              fontSize: 15.0,

                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            'email'.toUpperCase(),

                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontFamily: 'Roboto',
                                                fontSize: 13.0,
                                                color: Colors.grey
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20.0),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'phone number goes here'
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
                                              fontFamily: 'Roboto',
                                              fontSize: 15.0,

                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            'Phone Number'.toUpperCase(),

                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.normal,
                                                fontFamily: 'Roboto',
                                                fontSize: 13.0,
                                                color: Colors.grey
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],

                                  ),
                                  SizedBox(height: 15.0),
                                ],
                              ),
                            ),


                          ),

                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.info, size: 45,
                                      color: Colors.greenAccent),
                                  title: Text('About Us'),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  onTap: () {}
                                  ,
                                ),
                                ListTile(
                                  leading: Icon(Icons.security, size: 45,
                                      color: Colors.greenAccent),
                                  title: Text('Privacy'),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  onTap: () {}
                                  ,
                                ),
                                ListTile(
                                  leading: Icon(Icons.feedback, size: 45,
                                      color: Colors.greenAccent),
                                  title: Text('Give Us Feedback'),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  onTap: () {}
                                  ,
                                ),
                                ListTile(
                                  leading: Icon(Icons.delete_forever, size: 45,
                                      color: Colors.greenAccent),
                                  title: Text('Wipe data'),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  onTap: () {}
                                  ,
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 130.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 130.0,
              width: 130.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
              ),
            ),
          )
        ],
      ),
    );
  }

}


