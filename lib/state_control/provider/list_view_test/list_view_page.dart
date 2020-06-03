import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterproject/state_control/provider/list_view_test/base/multi_state_widget.dart';
import 'package:flutterproject/state_control/provider/list_view_test/base/page_state_view_model.dart';
import 'package:provider/provider.dart';

class ListModel extends PageStateViewModel {
  int _count = 0;

  int get count {
    return _count;
  }

  void load() {
    _count += 20;
    state = PageState.content;
  }

  ListModel() {
    state = PageState.loading;
    Future.delayed(Duration(seconds: 2), (){
      _count = 50;
      state = PageState.content;
    });
  }
}

class ListViewTest extends StatelessWidget {
  final ListModel model = ListModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListModel>.value(
      value: model,
      child: Consumer<ListModel>(
        builder: (context, model, child) {
            return MultiStateWidget(
              model.state,
              builder: (context) {
                return child;
              },
            );
        },
        child: ListViewContent(model),
      ),
    );
  }
}

class ListViewContent extends StatefulWidget {

  final ListModel _model;

  ListViewContent(this._model);

  @override
  ListViewContentState createState() => new ListViewContentState();
}

class ListViewContentState extends State<ListViewContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewTest'),
      ),
      body: SafeArea(
        child: Consumer<ListModel>(
          builder: (context, model, child) {
            return EasyRefresh(
              footer: ClassicalFooter(),
              onLoad: () async {
                widget._model.load();
              },
              child: ListView.builder(
                itemCount: model.count,
                itemExtent: 44,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("index: $index"),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
