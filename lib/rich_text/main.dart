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
            children: r'#_$这是一个#_$需要特殊#_$展示#_$的字符串'.classicsStyleTextSpanList(
              TextStyle(color: Colors.black),
              specialStyle: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
