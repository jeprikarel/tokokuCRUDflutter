import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'listUser.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerLevel;

  void editData(){
    var url = "http://192.168.3.57/tokoku/editdata.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": controllerLevel.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controllerUsername = new TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword = new TextEditingController(text: widget.list[widget.index]['password']);
    controllerLevel = new TextEditingController(text: widget.list[widget.index]['level']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Edit"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person,color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerUsername,
                    validator: (value) {
                      if(value.isEmpty) return 'Masukkan user';
                    },
                    decoration: new InputDecoration(
                      hintText: "NamaUser", labelText: "NamaUser"
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerPassword,
                    validator: (value){
                       if(value.isEmpty) return 'Masukkan Password';
                    },
                    decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password"
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerLevel,
                    validator: (value){
                       if(value.isEmpty) return 'Masukkan Level';
                    },
                    decoration: new InputDecoration(
                      hintText: "Level", labelText: "Level"
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Simpan"),
                  color: Colors.white,
                  onPressed: (){
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new ListUser()
                      )
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
