import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConcernState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConcernState>>{
      ConcernAction.action: _onAction,
    },
  );
}

ConcernState _onAction(ConcernState state, Action action) {
  final ConcernState newState = state.clone();
  return newState;
}
