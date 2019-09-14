import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayState>>{
      PlayAction.action: _onAction,
    },
  );
}

PlayState _onAction(PlayState state, Action action) {
  final PlayState newState = state.clone();
  return newState;
}
