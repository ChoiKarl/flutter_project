import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:provider/provider.dart';

class BasicUsePage extends StatefulWidget {
  @override
  BasicUsePageState createState() => new BasicUsePageState();
}

class BasicUsePageState extends State<BasicUsePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: Selector0<Counter>(
        shouldRebuild: (pre, next) => false,
        selector: (context) => null,
        builder: (context, _, child) {
          print('123');
          return Scaffold(
            appBar: AppBar(
              title: Text('基本使用'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("跳转到下一页"),
                    onPressed: () {
                      print("RaisedButton $context");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
                    },
                  ),
                  ItemWidget1(),
                  ItemWidget2(),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Provider.of<Counter>(context, listen: false).count += 1;
              },
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget1 extends StatefulWidget {
  @override
  ItemWidget1State createState() => new ItemWidget1State();
}

class ItemWidget1State extends State<ItemWidget1> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Consumer<Counter>(
        builder: (context, counter, child) {
          return Text(
            "${counter.count}",
            style: TextStyle(fontSize: 20),
          );
        },
      ),
    );
  }
}

class ItemWidget2 extends StatefulWidget {
  @override
  ItemWidget2State createState() => new ItemWidget2State();
}

class ItemWidget2State extends State<ItemWidget2> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<Counter>(context).count;
    print("ItemWidget2 rebuild");
    return Container(
      color: Colors.red,
      child: Text(
        "$count",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int _count = 10;

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }
}

class UserInfo extends ChangeNotifier {
  String _name = "";
  int _age = 0;

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  int get age => _age;

  set age(int value) {
    _age = value;
    notifyListeners();
  }
}
