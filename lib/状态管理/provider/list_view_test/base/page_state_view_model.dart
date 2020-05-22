import 'package:flutter/material.dart';

/// 页面状态
enum PageState {
  // 未定义
  undefined,
  // 加载中
  loading,
  // 显示内容
  content,
  // 空页面
  empty,
  // 错误页
  error
}

class PageStateViewModel extends ChangeNotifier {
  PageState _pageState = PageState.undefined;

  set state(PageState state) {
    _pageState = state;
    notifyListeners();
  }

  PageState get state {
    return _pageState;
  }
}
