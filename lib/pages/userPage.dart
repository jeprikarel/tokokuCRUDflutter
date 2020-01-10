import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Home User'),),
      body: new Column(
        children: <Widget>[
          new Text('Saya adalah user'),
          RaisedButton(color: Colors.redAccent,
            child: Text('Exit', style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/LoginPage'); 
            },
          )
        ],
      ),
      
    );
  }
}