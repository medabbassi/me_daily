import 'package:flutter/material.dart';

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
                      padding: const EdgeInsets.only(),
                      child:,
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
