import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const plugin = const MethodChannel("test");
  static const eventPlugin = const EventChannel("eventPlugin");
  static const basicChannel = BasicMessageChannel("basicChannel", StandardMessageCodec());

  @override
  void initState() {
    super.initState();
    plugin.setMockMethodCallHandler((method) {
      print(method.method);
      return Future.value(method.method);
    });

    basicChannel.setMockMessageHandler((v) {
      return Future.value(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础Widget'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text("发送"),
            onPressed: () {
              plugin.invokeMethod("sending", 123456).then((value) {
                print("value = $value");
              });
//              basicChannel.send("message").then((value) {
//                print("value = $value");
//              });

//              WriteBuffer buffer = WriteBuffer();
//              writeSize(buffer, 123456);

            },

          )
        ),
      ),
    );
  }

  void writeSize(WriteBuffer buffer, int value) {
    assert(0 <= value && value <= 0xffffffff);
    if (value < 254) {
      buffer.putUint8(value);
    } else if (value <= 0xffff) {
      buffer.putUint8(254);
      buffer.putUint16(value);
    } else {
      buffer.putUint8(255);
      buffer.putUint32(value);
    }
    var result = buffer.done();
    print(result.buffer.asUint16List());

    print(16639 | 482);
  }
}