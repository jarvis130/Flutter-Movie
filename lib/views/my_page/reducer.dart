import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/videolist.dart';
import 'package:movie/models/concernlist.dart';
import 'action.dart';
import 'state.dart';

Reducer<MyState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyState>>{
      MyAction.action: _onAction,
      MyAction.setConcernState: _setConcernState,
      MyAction.setFavoritesState: _setFavoritesState,
//      MyAction.loadConcernMore: _onLoadConcernMore,
//      MyAction.loadFavoritesMore: _onLoadFavoritesMore,
      // MyAction.filterChanged:_onFilterChanged
    },
  );
}

MyState _onAction(MyState state, Action action) {
  final MyState newState = state.clone();
  return newState;
}

MyState _setConcernState(MyState state, Action action) {
  final ConcernListModel q = action.payload ??
      ConcernListModel.fromParams(results: List<ConcernListResult>());
  final MyState newState = state.clone();
  newState.concerns = q;
  return newState;
}

MyState _setFavoritesState(MyState state, Action action) {
  final MovieListModel q = action.payload ??
      MovieListModel.fromParams(results: List<MovieListResult>());
  final MyState newState = state.clone();
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
