import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  final String text;
  ProfilePage(this.text);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("profile page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => pop(context),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop("profile pop");
  }
}
