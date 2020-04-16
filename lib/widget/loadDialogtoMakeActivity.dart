import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';

class Dialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DialogState();
  }
}

class DialogState extends State<Dialog> {

  void showDialogBox(BuildContext context) {
    // flutter defined function
    showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (BuildContext context, Animation animation,
            Animation secAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black45,

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0, left: 16.0, top: 8.0),
                      child: getToolBar(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),

                  ],
                )

            ),
          );
        });
  }

  Widget getToolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/images/undo.svg',
              color: Colors.black, width: 20, height: 18), onPressed: () {},
        ),
        SizedBox(width: 8.0),

        IconButton(
          icon: SvgPicture.asset('assets/images/close.svg'), onPressed: () {},
        )
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
