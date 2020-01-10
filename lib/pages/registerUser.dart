import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerLevel = new TextEditingController();

  var _formkey = GlobalKey<FormState>();

  void addData(){
    var url = "http://192.168.3.57/tokoku/adddata.php";
    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": controllerLevel.text
    });
     Fluttertoast.showToast(
                              msg: "Data berhasil ditambahkan",
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIos: 3,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.indigo[50],
                              fontSize: 20.0) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Tambah User"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person,color: Colors.black,),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value){
                        if(value.isEmpty) return 'Masukkan User';
                      },
                      decoration: new InputDecoration(
                        hintText: "NamaUser",labelText: "NamaUser",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.vpn_key,color: Colors.black,),
                    title: new TextFormField(
                      controller: controllerPassword,
                      validator: (value){
                        if(value.isEmpty) return 'Masukkan Password';
                      },
                      decoration: new InputDecoration(
                        hintText: "Password",labelText: "Password",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.list,color: Colors.black,),
                    title: new TextFormField(
                      controller: controllerLevel,
                      validator: (value){
                        if(value.isEmpty) return 'Masukkan Level';
                      },
                      decoration: new InputDecoration(
                        hintText: "Level",labelText: "Level",
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
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                  ),
                  onPressed: (){
                    // addData();
                    // Navigator.of(context).push(
                    //   new MaterialPageRoute(
                    //     builder: (BuildContext context) => new ListarUser()
                    //   )
                    // );
                    if(_formkey.currentState.validate()){
                      addData();
                     
                      Navigator.of(context);
                    }
                  },
                ),
                new RaisedButton(
                  child: new Text("Exit"),
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/adminPage');
                  },
                )
                ],
              )
            ],
          ),
          ),
      ),
    );
  }
}