import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'main',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Home> {

  Future<int> from() async {
    return 123;
  }

  @override
  void initState() {
    super.initState();

    var s = Stream.fromFuture(Future.value(123));
    s.listen((v) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('main'),
      ),
      body: Container(

      ),
    );
  }
}