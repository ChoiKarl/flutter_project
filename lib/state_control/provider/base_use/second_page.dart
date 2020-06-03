import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'basic_use_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("second page $context");
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(),
      floatingActionButton: Consumer<Counter>(
        builder: (context, counter, child) {
          return FloatingActionButton(
            onPressed: () {
              Provider.of<Counter>(context).count = 99;
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}