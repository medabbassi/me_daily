import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:me_daily/module/tip.dart';
import 'package:me_daily/widget/loadImage.dart';

bool liked = false;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }

}

bool isLiked = false;

// ignore: must_be_immutable
class _HomeScreenState extends State<HomeScreen> {
  bool liked = false;
  int currentIndex = 0;
  bool isTipVisible = false;
  bool isLiked = false;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Tip tip = new Tip('Drink Water At The Right Time',
      bulletPoints: [
        '2 Cups after waking up',
        '1 Cup 30 mn before a meal',
        '1 Cup before taking a bath.',
        '1 Cup before going to bed.'
      ],
      isVisible: true);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Scaffold(


      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: getToolBar(),
            ),
            Align(
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/cloudy.svg',
                    height: 52,
                    width: 52,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              text: 'Morning, ',
                            ),
                            TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              text: '',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Wednesday, 25 March 2020',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.0),
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
            Align(

              child: Text(
                'My Activities',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto'
                ),
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
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          print('presssed flatbutton');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}


Widget getToolBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

      Row(
        children: <Widget>[

          SizedBox(
            width: 18.0,
          ),
          SvgPicture.asset('assets/images/bell.svg',
              color: Colors.black, width: 20, height: 20),
          SizedBox(
            width: 8.0,
          ),
          Image.network(
            "https://drive.google.com/uc?export=view&id=1bcQaCdWNUsXF2he704ZfUrofxw6KV9KH",
            width: 30,
            height: 30,
          ),
        ],
      )
    ],
  );
}

Widget getTip(Tip tip) {
  return Card(
    margin: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Container(
      width: size,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Tip Of The Day',
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              InkWell(
                onTap: () {}
                ,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            tip.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16.0,
                    ),

                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {

              },

            ),
          ),
        ],
      ),
    ),
  );
}

