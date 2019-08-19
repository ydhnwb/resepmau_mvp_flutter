import 'package:flutter/material.dart';
import 'package:resepmau_flutter/contracts/register_activity_contract.dart';
import 'package:toast/toast.dart';
import 'package:resepmau_flutter/main.dart';
import 'package:resepmau_flutter/presenters/register_activity_presenter.dart';

class RegisterActivity extends StatefulWidget {
  @override
  _RegisterActivityState createState() => _RegisterActivityState();
}

class _RegisterActivityState extends State<RegisterActivity> implements RegisterActivityView{
  RegisterActivityPresenter presenter;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    presenter = RegisterActivityPresenter(this);
  }

  void _doRegister(String name, String email, String password){
    print("$name $email $password");
    if(name.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
      if(name.length > 5){
        if(password.length > 8){
          presenter?.register(name, email, password);
        }else{
          toast("Password at least eight letter");
        }
      }else{
        toast("Name at least five letter");
      }
    }else{
      toast("Please fill all forms");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("You need to fill all these form to use this application. Please note that password must be 8 char or more"),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child:Text("FULL NAME", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 15.0,),
              ),
            ),

            TextField(
              controller: nameController,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'John Doe',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 16.0),
              child:Text("EMAIL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 15.0,),
              ),
            ),
            TextField(
              controller: emailController,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'youremail@mail.com',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 16.0),
              child:Text("PASSWORD", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 15.0,),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '******',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            Divider(height: 24.0,),

            ButtonTheme(
              minWidth: double.infinity,
              child: MaterialButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  _doRegister(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim());
                },
                child: Text('Create account'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void finish() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage()), (r) => false);

  @override
  void toast(String message) => Toast.show(message, context);
}
