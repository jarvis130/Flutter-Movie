import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HotMovieState> buildReducer() {
  return asReducer(
    <Object, Reducer<HotMovieState>>{
      HotMovieAction.action: _onAction,
    },
  );
}

HotMovieState _onAction(HotMovieState state, Action action) {
  final HotMovieState newState = state.clone();
  return newState;
}
