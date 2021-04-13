import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'pop menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  final GlobalKey _buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pop menu'),
      ),
      body: Container(
        child: GestureDetector(
          key: _buttonKey,
          onTapUp: (details) {
            Offset offset = details.globalPosition;
            double screenWidth = MediaQuery.of(context).size.width;
            print(offset);
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                  offset.dx, offset.dy, screenWidth - offset.dx, 0),
              items: [
                PopupMenuItem(
                  child: Text("哈哈哈"),
                ),
                PopupMenuItem(
                  child: Text("呵呵呵"),
                ),
                PopupMenuItem(
                  child: Text("你好啊"),
                ),
              ],
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            padding: EdgeInsets.all(10),
            color: Colors.red,
            child: Text("弹出弹窗"),
          ),
        ),
      ),
    );
  }
}
