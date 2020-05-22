import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '异步',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainStatefulWidget(),
  ));
}

class MainStatefulWidget extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MainStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('异步'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                print("123");
              },
              child: Text("按钮1"),
            )
          ],
        ),
      ),
    );
  }


}
