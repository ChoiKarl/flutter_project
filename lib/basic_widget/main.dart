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
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("HomeNumber: $number"),
              onPressed: () {
                setState(() {
                  number++;
                });
              },
            ),
            ContentView()
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContentView extends StatefulWidget {
  int _number = 0;

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    CancelableOperation o = CancelableOperation.fromFuture(Future.value(1), onCancel: (){

    });
    CancelableCompleter();
    return Container(
      child: RaisedButton(
        child: Text("ContentView:${widget._number}"),
        onPressed: () {
          setState(() {
            widget._number++;
          });
        },
      ),
    );
  }
}
