import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:me_daily/interfaces/profile.dart';
import 'package:me_daily/interfaces/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Uncomment if you use injector package.
// import 'package:my_app/framework/di/injector.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  Color color = const Color(0x5FF9EF);
  Color color2 = const Color(0x52D99E);

  // Insert into injector file if you use it.
  // injector.map<LoginBloc>((i) => LoginBloc(i.get<Repository>()), isSingleton: true);

  // Uncomment if you use injector.
  // final _bloc = injector.get<LoginBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isLoading = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.lightGreenAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/undraw_welcome_cats_thqn.svg',
              width: 80,
              height: 100,
            ),
            SizedBox(height: 10),
            Opacity(
              opacity: 0.6,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Text(
                          'Existing ',
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        )),
                    new MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        }
                        ,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Text(
                          'New',
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        ))

                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 200,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.alternate_email),
                    title: TextFormField(
                      autofocus: true,
                      autocorrect: true,
                      controller: emailController,
                      cursorColor: Colors.amberAccent,
                      decoration: InputDecoration(hintText: 'email goes here'),
                    ),
                    trailing: SizedBox(width: 23),
                  ),
                  SizedBox(height: 5),
                  ListTile(
                    leading: Icon(Icons.vpn_key),
                    title: TextFormField(
                      autofocus: true,
                      controller: passwordController,
                      autocorrect: true,
                      cursorColor: Colors.amberAccent,
                      decoration:
                          InputDecoration(hintText: 'Password goes here'),
                    ),
                    trailing: Icon(Icons.visibility),
                  ),
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 35)),
                          RaisedButton(
                            onPressed: () {
                              print('Login Pressed');
                              signIn(emailController.text,
                                  passwordController.text);
                            },
                            color: Colors.green,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: new Text('Login',
                                style: new TextStyle(
                                    color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;

    var response =
        await http.post("http://192.168.1.15:4000/api/auth", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString('_id', jsonResponse['_id']);
        sharedPreferences.setString('first_name', jsonResponse['first_name']);
        sharedPreferences.setString('last_name', jsonResponse['last_name']);
        sharedPreferences.setString('email', jsonResponse['email']);
        sharedPreferences.setString(
            'phone_number', jsonResponse['phone_number']);
        print("Result: ${response.body}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Profile()),
                (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
