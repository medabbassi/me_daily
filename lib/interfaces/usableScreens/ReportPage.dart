import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/interfaces/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiredash/wiredash.dart';

class ReportPage extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wiredash(
      secret: "0e9hb8bra4uvp2611c948jxht1uvb0ww",
      projectId: "medaily-sv02f28",
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home: PageRepot(),
      ),
    );
  }
}

class PageRepot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageRepotState();
  }
}

class _PageRepotState extends State<PageRepot> {
  SharedPreferences sharedPreferences;
  String email = '';

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("_id") == null) {
      print(sharedPreferences.getString("_id"));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      email = prefs.getString('email') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapportz ici'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.lightGreenAccent,
        bottomOpacity: 0.2,
      ),
      body: Scaffold(
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Cliquez sur le bouton de flottaison pour signaler quelque chose ',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Wiredash.of(context).setOptions(userEmail: email);
          Wiredash.of(context).show();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
