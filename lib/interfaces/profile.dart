import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_daily/theme/Colors/lightColor.dart';
import 'package:me_daily/widget/topContainer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  String _name, _email, _phoneNumber;

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
                              child: Text(
                                "Mohamed Abbassi",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: Text(
                                'mabbassix3@gmail.com',
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
                                '+21650559630',
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
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                ],
              ),
            )

          ],
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

