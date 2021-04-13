import 'package:flutter/material.dart';
import 'package:flutterproject/gesture_recognizer/ios_gesture_tracker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FlutterGestureTracker(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onPanStart: (pan) {
                  print("onPanStart:${pan.globalPosition}");
                },
                onPanUpdate: (pan) {
                  print("onPanUpdate:${pan.globalPosition}");
                },
                onPanEnd: (_) {
                  print("onPanEnd}");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
