import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';
import 'action.dart';
import 'state.dart';

Reducer<CollectState> buildReducer() {
  return asReducer(
    <Object, Reducer<CollectState>>{
      MyAction.action: _onAction,
      MyAction.setConcernState: _setConcernState,
      MyAction.setFavoritesState: _setFavoritesState,
//      MyAction.loadConcernMore: _onLoadConcernMore,
//      MyAction.loadFavoritesMore: _onLoadFavoritesMore,
      // MyAction.filterChanged:_onFilterChanged
    },
  );
}

CollectState _onAction(CollectState state, Action action) {
  final CollectState newState = state.clone();
  return newState;
}

CollectState _setConcernState(CollectState state, Action action) {
  final UserListModel q = action.payload ?? new UserListModel();
  final CollectState newState = state.clone();
  newState.userListModel = q;
  return newState;
}

CollectState _setFavoritesState(CollectState state, Action action) {
  final GoodProducts q = action.payload ?? new GoodProducts();
  final CollectState newState = state.clone();
  newState.favorites = q;
  return newState;
}

//MyState _onLoadConcernMore(MyState state, Action action) {
//  final ConcernListModel q = action.payload ??
//      ConcernListModel.fromParams(results: List<ConcernListResult>());
//  final MyState newState = state.clone();
//
//  newState.concerns.page = q.page;
//  newState.concerns.results.addAll(q.results);
//
//  return newState;
//}

//MyState _onLoadFavoritesMore(MyState state, Action action) {
//  final VideoListModel q = action.payload ??
//      VideoListModel.fromParams(results: List<VideoListResult>());
//  final MyState newState = state.clone();
//
//  newState.favorites.page = q.page;
//  newState.favorites.results.addAll(q.results);
//
//
//  return newState;
//}

// MyState _onFilterChanged(MyState state, Action action) {
//   final bool b=action.payload??true;
//   final MyState newState = state.clone();
//   newState.showmovie=b;
//   return newState;
// }
