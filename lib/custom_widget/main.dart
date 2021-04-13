import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

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
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('main'),
      ),
      body: Center(
        child: Container(
          color: Colors.green,
          width: 333,
          height: 333,
          child: CustomMultiChildLayout(
            delegate: KLLayoutDelegate(),
            children: <Widget>[
              LayoutId(id: "1", child: Container(color: Colors.red, width: 40, height: 40)),
              LayoutId(id: "2", child: Container(color: Colors.red, width: 40, height: 40)),
              LayoutId(id: "3", child: Container(color: Colors.red, width: 40, height: 40)),
              LayoutId(id: "4", child: Container(color: Colors.red, width: 40, height: 40)),
            ],
          ),
        ),
      ),
    );
  }
}

class KLLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {

    print("size = $size");
    layoutChild("1", BoxConstraints.loose(Size(40, 40)));
    positionChild("1", Offset(0,0));

    layoutChild("2", BoxConstraints.loose(Size(40, 40)));
    positionChild("2", Offset(0,50));

    layoutChild("3", BoxConstraints.loose(Size(40, 40)));
    positionChild("3", Offset(0,100));

    layoutChild("4", BoxConstraints.loose(Size(40, 40)));
    positionChild("4", Offset(0,150));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
