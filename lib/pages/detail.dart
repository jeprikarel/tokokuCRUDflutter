import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:tokoku/pages/daftarUser.dart';
import 'package:tokoku/pages/editdata.dart';
import 'package:tokoku/pages/listUser.dart';

class Detail extends StatefulWidget {

  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData() {
  var url = 'http://192.168.3.57/tokoku/deleteData.php'  ;
    http.post(url,body: {
      'id' : widget.list[widget.index]['id']
    });
  }

  void Confirmar(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Anda ingin menghapus '${widget.list[widget.index]['username']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text('Ok Dihapus', style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new ListUser(),
              )
            ); 
          },
        ),
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context,child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("${widget.list[widget.index]['username']}"),),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30),),
                new Text(widget.list[widget.index]['username'],style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("Level : ${widget.list[widget.index]['level']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
                      onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Hapus"),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
                     onPressed: () => Confirmar(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
