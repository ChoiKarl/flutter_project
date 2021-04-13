import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '动画',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeTween;
  Animation _colorTween;
  Animation _opacityTween;
  Animation _transformTween;

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(seconds: 2));

    final curve =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _sizeTween = Tween(begin: 80.0, end: 200.0).animate(curve);
    _colorTween =
        ColorTween(begin: Colors.green, end: Colors.red).animate(curve);
    _opacityTween = Tween(begin: 0.5, end: 1.0).animate(curve);
    _transformTween = Tween(begin: 0.0, end: pi * 2).animate(curve);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Container(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityTween.value,
                child: Transform(
                  transform: Matrix4.rotationZ(_transformTween.value),
                  alignment: Alignment.center,
                  child: Container(
                    width: _sizeTween.value,
                    height: _sizeTween.value,
                    color: _colorTween.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _animationController.isAnimating
            ? Icon(Icons.stop)
            : Icon(Icons.play_circle_filled),
        onPressed: () {
          setState(() {
            if (_animationController.isAnimating) {
              _animationController.stop();
            } else {
              if (_animationController.status == AnimationStatus.reverse ||
                  _animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
              } else if (_animationController.status ==
                      AnimationStatus.forward ||
                  _animationController.status == AnimationStatus.dismissed) {
                _animationController.forward();
              }
            }
          });
        },
      ),
    );
  }
}
