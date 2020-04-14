import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";
  final String text;
  SettingsPage(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () {},
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}
