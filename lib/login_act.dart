import 'package:flutter/material.dart';
import 'package:resepmau_flutter/contracts/login_activity_contract.dart';
import 'package:resepmau_flutter/presenters/login_activity_presenter.dart';
import 'package:toast/toast.dart';
import 'package:resepmau_flutter/register_act.dart';
import 'package:resepmau_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginActivity extends StatefulWidget {

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> implements LoginActivityView{
  LoginActivityPresenter presenter;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    presenter = LoginActivityPresenter(this);
  }

  void doLogin(String email, String password){
    if(password.length < 8){
      toast("Password berisi setidaknya 8 karakter");
      return;
    }
    print(email +" - "+password);
    presenter.login(email, password);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 56.0),
              child: Column(
                children: <Widget>[
                  Text("Resepmau", style: TextStyle(color: Colors.redAccent,fontSize: 28.0, fontWeight: FontWeight.w600)),
                  Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text("Easily share your receipt with others")

                  )
                ],
              )
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "EMAIL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      controller: emailController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'yudhanewbie@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: new Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                doLogin(emailController.text.trim(), passwordController.text.trim());
              },
              child: Text("LOGIN"),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text("If you dont have an account, you can register"),
            ),

            MaterialButton(
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterActivity()))
              },
              child: Text("REGISTER"),
            )
          ],
        ),
      ),
    );

  }

  @override
  void finish() =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));

  @override
  void toast(String message) => Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

}