import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoku/pages/listUser.dart';
import 'package:tokoku/pages/adminPage.dart';
import 'package:tokoku/pages/registerUser.dart';
import 'package:tokoku/pages/userPage.dart';


void main() => runApp(LoginApp());

String username ;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter + MySQL',
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/adminPage': (BuildContext context) => new AdminPage(),
        '/userPage': (BuildContext context) => new UserPage(),
        '/LoginPage': (BuildContext context) => LoginPage(),
        '/pages/listUser': (BuildContext context) => ListUser(),
        '/pages/registerUser': (BuildContext context) => AddData(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String pesan = '';

  Future<List> login() async {
    final response =
        await http.post("http://192.168.3.57/tokoku/login.php", body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        pesan = "Username atau password salah";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/adminPage');
      } else if (datauser[0]['level'] == 'penjualan') {
        Navigator.pushReplacementNamed(context, '/userPage');
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/imagebg.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 77.0),
                child: new CircleAvatar(
                  backgroundColor: Color(0xF81F73),
                  child: new Image(
                    width: 135,
                    height: 135,
                    image: new AssetImage('assets/images/avatar7.png'),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 93.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: 'User'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.black12,
                            ),
                            hintText: 'Password'),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                 // 'Lupa Password',
                 ' FLUTTER UMC CRUD',
                  style: TextStyle(
                    color: Colors.red,fontSize:30,fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // Container(
              //  child: Padding(
              //    padding: const EdgeInsets.all(2.0),
              //    child: Text('data',style: TextStyle(color: Colors.white),),
              //  ),
              // ),
              Spacer(),
              new RaisedButton(
                child: new Text('Login'),
                color: Colors.greenAccent,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)
                ),
                onPressed: (){
                  login();
                  Navigator.pop(context);
                },
              ),
              Text(pesan,
              style: TextStyle(
                fontSize: 25.0,color: Colors.red
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
