import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:me_daily/components/flat_button_costum.dart';
import 'package:me_daily/components/page_header.dart';
import 'package:me_daily/components/text_form_validator.dart';
import 'package:toast/toast.dart';

// ignore: camel_case_types
class userPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _userPasswordPageState();
  }
}

class _userPasswordPageState extends State<userPasswordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(AntDesign.getIconData("logout")),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            PageHeader(
              title: 'Changer mot de passe',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              //child: Text('${user.name}'),
            ),
            SizedBox(height: 10),
            TextFormFieldValidation(
              hint: 'mot de passe',
              //initialValue: user.password,
              onValueChanged: (val) {
                //user.password = val;
              },
            ),
            SizedBox(height: 10),
            FlatButtonCustom(
              title: 'SOUMETTRE',
              color: Colors.greenAccent,
              onTap: () {
                Toast.show("Mot de passe a été changer ", context,
                    backgroundColor: Colors.lightGreenAccent,
                    textColor: Colors.white,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM);

                /* if (formKey.currentState.validate()) {
                  usersProvider.updateUserPassword(user: user);
                  Navigator.of(context).pop();
                }*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
