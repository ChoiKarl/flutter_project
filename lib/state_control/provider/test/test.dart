import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModel extends ChangeNotifier {
  String _text = "";

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }

  bool _show = false;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}

class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => new TestPageState();

}

class TestPageState extends State<TestPage> {
  ViewModel vm = ViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>.value(
      value: vm,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("按钮1"),
                onPressed: () {
                  vm.show = !vm.show;
                },
              ),
              Selector<ViewModel, bool>(
                selector: (context, vm) => vm.show,
                shouldRebuild: (pre, next) {
                  print("pre = $pre, next = $next");
                  return true;
                },
                builder: (_, __, child) {
                  return child;
                },
                child: Selector<ViewModel, String>(
                  selector: (context, vm) => vm.text,
                  shouldRebuild: (_, __) => _ != __,
                  builder: (context, text, _) {
                    return FlatButton(
                      child: Text("按钮" + text),
                      onPressed: () {
                        vm.text = vm.text + "1";
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Contain extends StatefulWidget {
  @override
  ContainState createState() => new ContainState();
}

class ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}