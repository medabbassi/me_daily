import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:me_daily/module/weight_entry.dart';
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
  List<WeightEntry> weightSaves = new List();
  ScrollController _listViewScrollController = new ScrollController();
  double _itemExtent = 50.0;

  @override
  Widget build(BuildContext context) {
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
              new ListView.builder(
                shrinkWrap: true,
                reverse: true,
                controller: _listViewScrollController,
                itemCount: weightSaves.length,
                itemBuilder: (buildContext, index) {
                  //calculating difference
                  double difference = index == 0
                      ? 0.0
                      : weightSaves[index].weight -
                      weightSaves[index - 1].weight;
                  return new InkWell(

                  );
                },
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


