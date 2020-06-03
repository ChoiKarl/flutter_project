import 'package:flutter/material.dart';
import 'string_extension.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('main'),
      ),
      body: Container(
        child: Text.rich(
          TextSpan(
              children: r'#_$a#_$4567#_$b#_$8#_$c#_$9999'.textSpanList
//              children: '9999'.textSpanList
//              children: r'#_$苹果#_$9999'.textSpanList
          )
        )
      ),
    );
  }
}
