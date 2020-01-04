import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/media_accountstatemodel.dart';

import 'action.dart';
import 'state.dart';

Reducer<MenuState> buildReducer() {
  return asReducer(
    <Object, Reducer<MenuState>>{
      MenuAction.action: _onAction,
      MenuAction.updateRating:_updateRating,
      MenuAction.updateFavorite:_updateFavorite,
      MenuAction.updateAttention:_updateAttention
    },
  );
}

MenuState _onAction(MenuState state, Action action) {
  final MenuState newState = state.clone();
  return newState;
}

MenuState _updateRating(MenuState state, Action action) {
  final MenuState newState = state.clone();
//  newState.accountState.rated=RatedResult.fromParams(value: action.payload);
//  newState.accountState.isRated=true;
  return newState;
}

MenuState _updateFavorite(MenuState state, Action action) {
  int favorite=action.payload;
  MenuState newState = state.clone();
  newState.model.product.isCollect = favorite;
  return newState;
}

MenuState _updateAttention(MenuState state, Action action) {
  int isAttention = action.payload;
  MenuState newState = state.clone();
  newState.model.product.isAttention = isAttention;
  return newState;
}