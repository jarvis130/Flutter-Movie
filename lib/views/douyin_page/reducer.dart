import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DouyinPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<DouyinPageState>>{
      DouyinPageAction.action: _onAction,
    },
  );
}

DouyinPageState _onAction(DouyinPageState state, Action action) {
  final DouyinPageState newState = state.clone();
  return newState;
}
