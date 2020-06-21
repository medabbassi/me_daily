import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:me_daily/Controllers/databasehelper.dart';
import 'package:me_daily/module/tip.dart';
import 'package:me_daily/theme/Colors/lightColor.dart';
import 'package:me_daily/widget/AddMessageDialog.dart';
import 'package:me_daily/widget/addEmailDialog.dart';
import 'package:me_daily/widget/addEntryDialog.dart';
import 'package:me_daily/widget/loadImage.dart';
import 'package:unicorndial/unicorndial.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}


// ignore: must_be_immutable
class HomeScreenState extends State<HomeScreen> {


  //bool isTipVisible = false;
  bool isLiked = false;
  AnimationController _controller;
  DatabaseHelper databaseHelper = DatabaseHelper();

  //List<Activity> activityList;
  //List<Email> emailList;
  //List<Message> smsList;


  void _openAddEntryDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new AddEntryDialog();
        },
        fullscreenDialog: true));
  }

  void _openAddEmailDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new AddEmailDialog();
        },
        fullscreenDialog: true
    ));
  }

  void _openAddMessageDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new AddMessageDialog();
        },
        fullscreenDialog: true
    ));
  }


  List<UnicornButton> _getProfileMenu() {
    List<UnicornButton> children = [];

    // Add Children here

    children.add(_profileOption(iconData: Icons.email, onPressed: () {
      _openAddEmailDialog();
      print('pressed');
    }));
    children.add(_profileOption(iconData: Icons.message, onPressed: () {
      _openAddMessageDialog();
      print("pressed");
    }));
    children.add(_profileOption(iconData: Icons.directions_walk, onPressed: () {
      //DialogState().showDialogBox(context);
      _openAddEntryDialog();
      print("pressed");
    }));

    return children;
  }
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
      bulletPoints: [],
      isVisible: true);

  void showDebugger() {
    print("home work");
  }

  Widget _profileOption({IconData iconData, Function onPressed}) {
    return UnicornButton(

        currentButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.greenAccent[500],
          mini: true,
          child: Icon(iconData),
          onPressed: onPressed,
        ));
  }

  String date = new DateFormat('dd-mm-yyyy')
      .format(new DateTime.now())
      .toString();
  String time = new DateTime.now().toString();
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(
        color: Colors.white70,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: SvgPicture.asset('assets/images/menu.svg',
                          color: Colors.black, width: 20, height: 20),
                      onPressed: () {
                        print('menu button pressed');
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                          );*/
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
                )
                    //getToolBar()

            ),

                SizedBox(height: 6.0),
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
                            height: 5,
                          ),
                          Text(
                            date,
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

                SizedBox(height: 13.0),
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
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(

                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            "11:00-12:00",
                                            style: TextStyle(fontSize: 30.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Complete dev my app",
                                            style: TextStyle(fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    subheading('Mes Activitées'),

                  ],
                ),

                SizedBox(height: 8.0),
                Align(
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                    ),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(16.0)
                          )
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
                                  SvgPicture.asset(
                                    'assets/images/calendar.svg',
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(width: 12.0),
                                  Text(
                                    'Planifier pour aujourdhui',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                              ),
                                ],
                              ),
                              InkWell(
                                onTap: () =>
                                    setState(() {
                                      tip.isVisible = false;
                                    }),
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],

                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Hello world",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0),
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
                                    Text(
                                      "Fais le rapidement",
                                      style: TextStyle(fontSize: 13),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 1.0),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Card(

                      margin: EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      ),

                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            ],
                          ),


                          new ListTile(
                            leading: const Icon(Icons.query_builder),
                            title: const Text('Recent email',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  backgroundColor: Colors.white70),),
                            subtitle: const Text('none'),
                          ),
                          SizedBox(height: 10.0),
                          new ListTile(
                            leading: const Icon(Icons.query_builder),
                            title: const Text('Recent messages',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  backgroundColor: Colors.white70),),
                            subtitle: const Text('none'),
                          ),
                        ],
                      ),
                    )
                ),
          ],
        ),
      ),

      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.greenAccent[700],
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: _getProfileMenu(),
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

/*Widget getTip(Tip tip) {
  return Card(
    margin: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child:
  );
}*/







