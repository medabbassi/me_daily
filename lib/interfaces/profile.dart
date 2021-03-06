import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:me_daily/interfaces/login/login_page.dart';
import 'package:me_daily/interfaces/usableScreens/ReportPage.dart';
import 'package:me_daily/interfaces/usableScreens/password_reset.dart';
import 'package:me_daily/theme/Colors/lightColor.dart';
import 'package:me_daily/widget/topContainer.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  SharedPreferences sharedPreferences;
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';

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
          MaterialPageRoute(builder: (BuildContext context) => Login()), (
          Route<dynamic> route) => false);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      firstName = prefs.getString('first_name') ?? '';
      lastName = prefs.getString('last_name') ?? '';
      email = prefs.getString('email') ?? '';
      phoneNumber = prefs.getString('phone_number') ?? '';
    }
  }


  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu,
                          color: LightColors.kDarkBlue, size: 30.0),
                      Icon(
                        Icons.more,
                        color: LightColors.kDarkBlue, size: 25.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0.0
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: 0.75,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: LightColors.kRed,
                          backgroundColor: LightColors.kDarkYellow,
                          center: CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 35.0,
                            backgroundImage: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(

                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      firstName,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: LightColors.kDarkBlue,
                                          fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      lastName,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: LightColors.kDarkBlue,
                                          fontWeight: FontWeight.w800
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: Text(
                                email,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                phoneNumber,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    leading: new SvgPicture.asset("assets/images/password.svg",
                        height: 30.0, width: 30),
                    title: subheading("Sécurité"),
                    trailing: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                          return userPasswordPage();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    leading: new SvgPicture.asset("assets/images/loan.svg",
                        height: 30.0, width: 30),
                    title: subheading("Termes et confidentialité"),
                    trailing: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: new SvgPicture.asset("assets/images/clean.svg",
                        height: 30.0, width: 30),
                    title: subheading("Essuyez mes données"),
                    trailing: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: new SvgPicture.asset("assets/images/feedback.svg",
                        height: 30.0, width: 30),
                    title: subheading("Votre Commentaire"),
                    trailing: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                          return ReportPage();
                        }));
                      },
                    ),
                  ),
                  ListTile(
                    leading: new SvgPicture.asset(
                        "assets/images/exit.svg", height: 30.0, width: 30),
                    title: subheading("Se déconnecter"),
                    trailing: IconButton(
                      icon: Icon(Icons.settings), onPressed: () {
                      sharedPreferences.clear();

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext context) =>
                              Login()), (Route<dynamic> route) => false);
                    },),
                  ),
                  SizedBox(height: 12),
                  AddButton()
                ],
              ),
            )

          ],
        ),
      ),


    );
  }

  Widget AddButton() {
    var firstColor = Color(0xff5b86e5),
        secondColor = Color(0xff36d1dc);

    return NiceButton(
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: "Sé Connecter",
      gradientColors: [secondColor, firstColor],
      onPressed: () {
        debugPrint('FAB clicked');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      background: null,
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
}


