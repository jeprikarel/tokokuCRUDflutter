import 'package:flutter/material.dart';
import 'package:tokoku/pages/registerUser.dart';
//import 'package:tokoku/pages/registerUser.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('HomeUser'),),
      body: new Column(
        children: <Widget>[
          // new Text('Estamos en ventas'),
          // RaisedButton(
          //   child: Text('Salir'),
          //   onPressed: (){
          //     Navigator.pushReplacementNamed(context, '/LoginPage'); 
          //   },
          // )
          Row(
            //Row1
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
                ),
                Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              )
            ],
          ),
          Row(
            //Row2
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
                ),
                Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              )
            ],
          ),
          Row(
            //Row3
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/pages/listUser');

                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
                ),
                Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/LoginPage');

                  },
                  child: new Icon(
                    Icons.exit_to_app,
                    color: Colors.redAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              )
            ],
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddData()
            )
          );
        },  
      ),
      
    );
  }
}