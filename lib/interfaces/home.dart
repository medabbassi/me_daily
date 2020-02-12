import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool liked = false;

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
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Now',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 30,
              ),
            ),
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
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
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

                splashColor: Colors.deepOrangeAccent[300],
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
                  color: Colors.deepOrange,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add_alarm),
        backgroundColor: Colors.green,
      ),
    );
  }

  void setState() {
    bool liked = false;

    liked != liked;
  }
}
