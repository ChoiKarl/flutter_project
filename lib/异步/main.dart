import 'package:flutter/material.dart';
import 'package:async/async.dart';

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
  CancelableOperation _op;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('异步'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  var future = Future.delayed(Duration(seconds: 2), (){
                    print("delay action");
                  });
                  _op = CancelableOperation.fromFuture(future, onCancel: () {
                    print("onCancel");
                    return "cancel rtn";
                  });

                  _op.value.then((_) {
                    print("delay action11111");
                  });
                },
                child: Text("按钮1"),
              ),
              RaisedButton(
                onPressed: () {
                  _op.cancel().then((value) {
                    print("==> $value");
                  });
                },
                child: Text("按钮2"),
              )
            ],
          ),
        ),
      ),
    );
  }


}
