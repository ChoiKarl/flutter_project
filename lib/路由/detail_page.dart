import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = "/detail";

  @override
  DetailPageState createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String arguments = ModalRoute.of(context).settings.arguments;

    10.rpx;

    return Scaffold(
      appBar: AppBar(
        title: Text("detail page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(arguments),
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


extension ScreenFit on int {
  double get rpx {
    return 0;
  }
}