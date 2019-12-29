import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavoritesState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavoritesState>>{
      FavoritesAction.action: _onAction,
    },
  );
}

FavoritesState _onAction(FavoritesState state, Action action) {
  final FavoritesState newState = state.clone();
  return newState;
}
