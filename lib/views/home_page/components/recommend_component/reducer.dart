import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendMovieState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendMovieState>>{
      RecommendMovieAction.action: _onAction,
    },
  );
}

RecommendMovieState _onAction(RecommendMovieState state, Action action) {
  final RecommendMovieState newState = state.clone();
  return newState;
}
