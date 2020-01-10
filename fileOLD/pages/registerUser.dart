import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  //TextEditingController controllerNivel = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "http://192.168.3.57/tokoku/adddata.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": _mySelection.toString(), //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      //"nivel": controllerNivel.text
    });
  }
  
  String _mySelection;
  List<Map> _myJson = [{"id":0,"name":"penjualan"},{"id":1,"name":"admin"}];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add User"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                          validator: (value) {
                            if (value.isEmpty) return "Masukkan nama user";
                          },
                      decoration: new InputDecoration(
                        hintText: "Nama User", labelText: "Nama User",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPassword,
                          validator: (value) {
                            if (value.isEmpty) return "Masukkan Password";
                          },
                      decoration: new InputDecoration(
                        hintText: "Password", labelText: "Password",
                      ),
                    ),
                  ),
                 Row(
                   children: <Widget>[
                     new Container(
                       margin: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.list),
                     ),
                     VerticalDivider(width: 40.0,),
                     new Container(                   
                       //margin: EdgeInsets.only(right: 80.0),
                       height: 50.0,
                       width: 100.0,
                      child: new DropdownButton<String>(
                            isDense: true,
                            hint: new Text("Level"),
                            iconSize: 40.0,
                            elevation: 10,
                            value: _mySelection,
                            onChanged: (String newValue) {
                              setState(() {
                                _mySelection = newValue;
                              });
                              print (_mySelection);
                            },
                            items: _myJson.map((Map map) {
                              return new DropdownMenuItem<String>(
                                //value: map["id"].toString(),
                                value: map["name"].toString(),
                                child: new Text(
                                  map["name"],
                                ),
                              );
                            }).toList(),
                         ),
                     ),
                   ],
                 ),
                  new Padding(
                   padding: const EdgeInsets.all(30.0),
                 ),              
                  new RaisedButton(
                    child: new Text("Add"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Keluar"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/adminPage');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
