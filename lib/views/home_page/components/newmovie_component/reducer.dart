import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NewMovieState> buildReducer() {
  return asReducer(
    <Object, Reducer<NewMovieState>>{
      NewMovieAction.action: _onAction,
    },
  );
}

NewMovieState _onAction(NewMovieState state, Action action) {
  final NewMovieState newState = state.clone();
  return newState;
}
