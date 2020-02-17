import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

bool liked = false;


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  bool liked = false;

  _pressed() {
    setState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Me Daily'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome Name here',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),

            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome Name here',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            CarouselSlider(
              height: 160.0,
              enlargeCenterPage: true,
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Center(
                          child: Text(
                            'text $i',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,

                            ),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 12.0),
            Text(
              'Friends similair activity',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  print('card clicked');
                },
                child: Container(

                  margin: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                  padding: EdgeInsets.all(10.0),
                  width: 350,
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '',
                          fit: BoxFit.fill,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Column(children: <Widget>[
                        new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'John Blavik',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        new Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'palying sport ',
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontWeight: FontWeight.normal,
                                fontSize: 10.0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ]),
                      new Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.pinkAccent : Colors.grey,
                          ),
                          iconSize: 20.0,
                          onPressed: _pressed(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Card(

              child: InkWell(

                splashColor: Colors.deepOrangeAccent[100],
                hoverColor: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  print('card clickedd');
                },
                child: Container(
                  foregroundDecoration: BoxDecoration(

                  ),
                  height: 120,
                  width: 350,
                  color: Colors.deepOrangeAccent[100],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          print('presssed flatbutton');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white70,
      ),
    );
  }

  void setState() {
    bool liked = false;

    liked != liked;
  }
}
