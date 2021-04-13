import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '底部弹窗',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('底部弹窗'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return Container(
                      height: 265,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white),
                    );
                  },
                ).then((v) {
                  print(v);
                });
              },
              child: Text("showModalBottomSheet"),
            ),
            RaisedButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  filter: ImageFilter.blur(),
                  builder: (context) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.red,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("pop"),
                      ),
                    );
                  },
                );
              },
              child: Text("showCupertinoModalPopup"),
            )
          ],
        ),
      ),
    );
  }
}
