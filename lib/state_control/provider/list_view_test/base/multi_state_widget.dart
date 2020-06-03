import 'package:flutter/material.dart';
import 'package:flutterproject/state_control/provider/list_view_test/base/page_state_view_model.dart';

typedef ContentBuilder = Widget Function(BuildContext context);

class MultiStateWidget extends StatefulWidget {
  final Widget loadingWidget;
  final Widget emptyWidget;
  final Widget errorWidget;
  final ContentBuilder builder;
  final PageState state;

  MultiStateWidget(
    this.state, {
    @required this.builder,
    Widget loadingWidget,
    Widget emptyWidget,
    Widget errorWidget,
  })  : this.loadingWidget = loadingWidget ?? _loadingWidget,
        this.emptyWidget = emptyWidget ?? _emptyWidget,
        this.errorWidget = errorWidget ?? _errorWidget;

  @override
  MultiStateWidgetState createState() => MultiStateWidgetState();

  static Widget get _loadingWidget {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("loading....."),
      ),
    );
  }

  static Widget get _emptyWidget {
    return Center(
      child: Text("empty"),
    );
  }

  static Widget get _errorWidget {
    return Center(
      child: Text("error"),
    );
  }
}

class MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  Widget build(BuildContext context) {
    Widget rtn;
    switch (widget.state) {
      case PageState.content:
        rtn = widget.builder(context);
        break;
      case PageState.loading:
        rtn = widget.loadingWidget;
        break;
      case PageState.empty:
        rtn = widget.emptyWidget;
        break;
      case PageState.error:
        rtn = widget.errorWidget;
        break;
      case PageState.undefined:
        rtn = Container(color: Colors.white,);
        break;
    }
    return rtn ?? Container(color: Colors.white,);
  }
}
