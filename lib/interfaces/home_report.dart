import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_daily/interfaces/usableScreens/TestScreen.dart';
import 'package:me_daily/interfaces/usableScreens/emailScreen.dart';
import 'package:me_daily/interfaces/usableScreens/messageScreen.dart';
import 'package:me_daily/widget/loadImage.dart';
import 'package:wiredash/wiredash.dart';

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      secret: "medaily-sv02f28",
      projectId: "0e9hb8bra4uvp2611c948jxht1uvb0ww",
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Me Daily',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: <Widget>[],
                bottom: TabBar(
                    unselectedLabelColor: Colors.green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.greenAccent]),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.greenAccent),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("mes activités"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("mon emails"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("mes sms"),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                ActivityList(),
                EmailList(),
                MessageList(),
              ]),
            )
        )


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
