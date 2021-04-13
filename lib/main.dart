import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Container(
        width: 255,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 50,
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "1312312312312312313131231213123123123123123131312312",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}