import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/models/activity.dart';
import 'package:me_daily/theme/Colors/lightColor.dart';
import 'package:me_daily/widget/active_progress_cards.dart';
import 'package:me_daily/widget/loadImage.dart';
import 'package:me_daily/widget/tasks_column.dart';

// ignore: camel_case_types
class flowAchievement extends StatefulWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _flowAchievementState();
  }


}

// ignore: camel_case_types
class _flowAchievementState extends State<flowAchievement> {
  int counts = 0;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Activity> activityList;


  count() async {
    final int d = await databaseHelper.getCount();
    setState(() {
      counts = d;
      print(counts);
    });
    return counts;
  }

  math.Random random = new math.Random();


  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 10);
    }
    return result;
  }

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //count= databaseHelper.getCount() as int ;

  }

  @override
  Widget build(BuildContext context) {
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1];
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Container(
          color: Colors.white70,
          child: Column(

            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
                child: getToolBar(),
              ),
              /*Padding(
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
                    fillMode: FillMode.below,
                    fillColor: Colors.white10,
                    pointsMode: PointsMode.all,
                    pointSize: 5.0,
                    pointColor: Colors.amber,
                  ),
                ),
              ),*/
              Container(
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  subheading('Mes activitées'),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              TasksColumn(
                                  Icons.alarm, LightColors.kRed, 'En faite',
                                  ' $counts activités'),
                              SizedBox(
                                height: 15.0,
                              ),
                              TasksColumn(
                                  Icons.blur_circular, LightColors.kDarkYellow,
                                  'En cours', '1 a commencé'),
                              SizedBox(height: 15.0),
                              TasksColumn(Icons.check_circle_outline,
                                  LightColors.kDarkBlue,
                                  'terminé', '18 taches '),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              subheading('Activitées en progrés'),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  ActiveProgressCard(
                                    cardColor: LightColors.kGreen,
                                    loadingPercent: 0.25,
                                    title: 'Medical App',
                                    subtitle: '9 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProgressCard(
                                    cardColor: LightColors.kRed,
                                    loadingPercent: 0.6,
                                    title: 'Making History Notes',
                                    subtitle: '20 hours progress',
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ActiveProgressCard(
                                    cardColor: LightColors.kDarkYellow,
                                    loadingPercent: 0.45,
                                    title: 'Sports App',
                                    subtitle: '5 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProgressCard(
                                    cardColor: LightColors.kBlue,
                                    loadingPercent: 0.5,
                                    title: 'Online Flutter Course',
                                    subtitle: '23 hours progress',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      ),
    );
  }
}

Text subheading(String title) {
  return Text(
    title,
    style: TextStyle(
        color: LightColors.kDarkBlue,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2),
  );
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

Widget progessCardsAndPlanners() {
  IconData icon;
  Color iconBackgroundColor;
  String title;
  String subtitle;
  int count = 0;

  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    subheading('Mes activitées'),
                  ],
                ),
                SizedBox(height: 15.0),
                TasksColumn(
                    Icons.alarm, LightColors.kRed, 'En faite', '$count'),
                SizedBox(
                  height: 15.0,
                ),
                TasksColumn(Icons.blur_circular, LightColors.kDarkYellow,
                    'En cours', '1 a commencé'),
                SizedBox(height: 15.0),
                TasksColumn(Icons.check_circle_outline, LightColors.kDarkBlue,
                    'terminé', '18 taches '),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                subheading('Activitées en progrés'),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ActiveProgressCard(
                      cardColor: LightColors.kGreen,
                      loadingPercent: 0.25,
                      title: 'Medical App',
                      subtitle: '9 hours progress',
                    ),
                    SizedBox(width: 20.0),
                    ActiveProgressCard(
                      cardColor: LightColors.kRed,
                      loadingPercent: 0.6,
                      title: 'Making History Notes',
                      subtitle: '20 hours progress',
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ActiveProgressCard(
                      cardColor: LightColors.kDarkYellow,
                      loadingPercent: 0.45,
                      title: 'Sports App',
                      subtitle: '5 hours progress',
                    ),
                    SizedBox(width: 20.0),
                    ActiveProgressCard(
                      cardColor: LightColors.kBlue,
                      loadingPercent: 0.5,
                      title: 'Online Flutter Course',
                      subtitle: '23 hours progress',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


