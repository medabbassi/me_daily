import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:me_daily/module/tip.dart';
import 'package:me_daily/widget/loadImage.dart';
import 'package:unicorndial/unicorndial.dart';

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

            SizedBox(height: 8.0),
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
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Center(
                          child: Text(
                            'text $i',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
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
                                'My plans for today',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
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
                        height: 20.0,
                      ),
                      Text(
                        tip.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
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
                                Text(
                                  "Do it quickly",
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
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: getMessagesAndEmail(),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.greenAccent[700],
        orientation: UnicornOrientation.HORIZONTAL,
        parentButton: Icon(Icons.add),
        childButtons: _getProfileMenu(),
      ),
    );
  }
}


Widget getToolBar() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
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

Size screenSize(BuildContext context) {
  return MediaQuery
      .of(context)
      .size;
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
Widget getMessagesAndEmail() {
  return Container(
      child: Card(

        margin: EdgeInsets.all(0),
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
            Text(
              'Recent messages',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.0),
            Text(
              'Recent email',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      )

  );
}

Widget _profileOption({IconData iconData, Function onPressed}) {
  return UnicornButton(
      currentButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[500],
        mini: true,
        child: Icon(iconData),
        onPressed: onPressed,
      ));
}

List<UnicornButton> _getProfileMenu() {
  List<UnicornButton> children = [];

  // Add Children here
  children.add(_profileOption(iconData: Icons.add_alert, onPressed: () {}));
  children.add(_profileOption(iconData: Icons.email, onPressed: () {}));
  children.add(_profileOption(iconData: Icons.message, onPressed: () {}));

  return children;
}

