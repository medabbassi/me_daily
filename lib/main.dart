import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/interfaces/flowAchievement.dart';
import 'package:me_daily/interfaces/home.dart';
import 'package:me_daily/interfaces/makeActivity.dart';
import 'package:me_daily/interfaces/profile.dart';


void main() => runApp(MaterialApp(home: BottomNavBar()));


class BottomNavBar extends StatefulWidget {
  static final String id = 'homescreen';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _pageController;
 
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.greenAccent,),
            Icon(Icons.list, size: 30, color: Colors.greenAccent),
            Icon(Icons.trending_up, size: 30, color: Colors.greenAccent),
            Icon(Icons.person, size: 30, color: Colors.greenAccent),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.greenAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
        ),

        body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomeScreen(),
            //MyHomePage(),
            MakeActivity(),
            flowAchievement(),
            Profile(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
        )
    );
  }
}
