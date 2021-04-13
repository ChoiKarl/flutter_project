import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterGestureTracker extends StatelessWidget {
  FlutterGestureTracker({Key key,this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.translucent,
      gestures: {
        _PointerTracker:
        GestureRecognizerFactoryWithHandlers<
            _PointerTracker>(
              () => _PointerTracker(),  //constructor
              (_PointerTracker instance) {  //initializer
                instance.onStart = (_){};
                instance.onUpdate = (_) {};
                instance.onDown = (_) {};
                instance.onEnd = (_) {};
                instance.onCancel = () {};
          },
        )
      },
      child: child,
    );
  }
}

class _PointerTracker extends PanGestureRecognizer {
  final _plugin = MethodChannel("ios/gestureConflict");
  bool _flutterGestureIsWorking = false;

  @override
  void rejectGesture(int pointer) {
    super.rejectGesture(pointer);
    _flutterGestureIsWorking = true;
    print("rejectGesture");
    _notify();
  }

  @override
  void acceptGesture(int pointer) {
    super.acceptGesture(pointer);
    _flutterGestureIsWorking = false;
    print("acceptGesture");
    _notify();
  }

  void _notify() {
    _plugin.invokeMethod("flutterGestureStateChanged", _flutterGestureIsWorking);
  }
}