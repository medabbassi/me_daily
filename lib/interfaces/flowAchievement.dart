import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:me_daily/widget/loadImage.dart';
// ignore: camel_case_types
class flowAchievement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _flowAchievementState();
  }


}

// ignore: camel_case_types
class _flowAchievementState extends State<flowAchievement> {
  math.Random random = new math.Random();

  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 10);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
                child: getToolBar(),
              ),
              Padding(
                padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
                child:
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 150.0,
                  child: new Sparkline(
                    data: data,
                    lineColor: Colors.lightGreen[500],
                    fillMode: FillMode.none,
                    fillColor: Colors.lightGreen[200],
                    pointsMode: PointsMode.all,
                    pointSize: 5.0,
                    pointColor: Colors.amber,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: <Widget>[
                      Row(

                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Widget getToolBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: SvgPicture.asset('assets/images/menu.svg',
            color: Colors.black, width: 20, height: 20),
        onPressed: () {
          print("object");
        },
      ),
      Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/search.svg',
              color: Colors.black, width: 18, height: 18),
          SizedBox(
            width: 8.0,
          ),
          SvgPicture.asset('assets/images/bell.svg',
              color: Colors.black, width: 20, height: 20),
          SizedBox(
            width: 8.0,
          ),
          LoadImage(
            "https://drive.google.com/uc?export=view&id=1bcQaCdWNUsXF2he704ZfUrofxw6KV9KH",
            30,
            30,
            0,
            30,
            30,
          ),
        ],
      )
    ],
  );
}


