import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//import 'package:tokoku/pages/daftarUser.dart';
import 'package:tokoku/pages/detail.dart';
import 'package:tokoku/pages/registerUser.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {

Future<List> getData() async {
  final response = await http.get('http://192.168.3.57/tokoku/getdata.php');
  return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: new Text('Daftar User'),
       actions: <Widget>[
         new IconButton(
           icon: Icon(Icons.home),
           onPressed: (){
            Navigator.pushReplacementNamed(context, '/adminPage'); 
           },
         )
         
       ],
       
          ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new AddData(),
          ));
        },
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData 
          ? new ItemList(
            list: snapshot.data,
          ) 
          : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      )
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                  list: list,
                  index: i,
                )
              ),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['username'],
                  style: TextStyle(
                    fontSize: 25.0,color: Colors.orangeAccent),
                ),
                leading: new Icon(Icons.person_pin,
                size: 67.0,
                color: Colors.orangeAccent,
                ),
                subtitle: new Text(
                  'Level : ${list[i]['level']}',
                  
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}