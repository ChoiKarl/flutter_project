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
  Animation _tweenAnimation;

  @override
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

    _tweenAnimation = Tween(begin: 100.0, end: 200.0).animate(curve);

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
            animation: _tweenAnimation,
            builder: (context, child) {
              return Icon(
                Icons.smartphone,
                color: Colors.blue,
                size: _tweenAnimation.value,
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
