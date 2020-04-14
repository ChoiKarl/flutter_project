import 'package:flutter/material.dart';
import '基本使用/basic_use_page.dart';
import 'package:provider/provider.dart';
import "collect_test/collect_test_page.dart";

//void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("列表收藏"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CollectTestPage();
                }));
              },
            ),
            RaisedButton(
              child: Text("基本使用"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BasicUsePage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
