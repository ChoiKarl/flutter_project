import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum StateEnum { normal, other }

class Model extends ChangeNotifier {
  StateEnum _state = StateEnum.normal;
  StateEnum get state => _state;
  set state(StateEnum value) {
    _state = value;
    notifyListeners();
  }

  String _name = "";
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }
}

class SelectorTestPage extends StatefulWidget {
  @override
  _SelectorTestPageState createState() => _SelectorTestPageState();
}

class _SelectorTestPageState extends State<SelectorTestPage> {
  Model _model = Model();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>.value(
      value: _model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SelectorTestPage'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Selector<Model, StateEnum>(
                  selector: (context, vm) => vm.state,
                  shouldRebuild: (pre, next) {
                    return pre != next;
                  },
                  builder: (context, state, child) {
                    return Text("$state");
                  },
                ),
                RaisedButton(
                  child: Text("change state"),
                  onPressed: () {
                    Model m = _model;
                    if (m.state == StateEnum.normal) {
                      m.state = StateEnum.other;
                    } else {
                      m.state = StateEnum.normal;
                    }
                  },
                ),
                Selector<Model, String>(
                  selector: (context, vm) => vm.name,
                  shouldRebuild: (pre, next) {
                    return pre != next;
                  },
                  builder: (context, name, child) {
                    return Text("$name");
                  },
                ),
                RaisedButton(
                  child: Text("change name"),
                  onPressed: () {
                    _model.name = _model.name + "a";
                  },
                  onLongPress: () {
                    _model.name = _model.name + "b";
                    if (_model.state == StateEnum.normal) {
                      _model.state = StateEnum.other;
                    } else {
                      _model.state = StateEnum.normal;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
