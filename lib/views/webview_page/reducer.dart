import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebPageState>>{
      WebPageAction.action: _onAction,
    },
  );
}

WebPageState _onAction(WebPageState state, Action action) {
  final WebPageState newState = state.clone();
  return newState;
}
