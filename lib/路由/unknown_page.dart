import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  static const String routeName = "/settings";
  final String text;
  UnknownPage(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unknown Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("没有$text页面"),
          ],
        ),
      ),
    );
  }
}
