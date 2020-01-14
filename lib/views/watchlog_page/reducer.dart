import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'action.dart';
import 'state.dart';

Reducer<WatchLogState> buildReducer() {
  return asReducer(
    <Object, Reducer<WatchLogState>>{
      WatchLogAction.action: _onAction,
      WatchLogAction.loadMore: _loadMore,
    },
  );
}

WatchLogState _onAction(WatchLogState state, Action action) {
  final WatchLogState newState = state.clone();
  return newState;
}

WatchLogState _loadMore(WatchLogState state, Action action) {
  GoodProducts model = action.payload  ?? new GoodProducts();
  WatchLogState newState = state.clone();
  newState.videoList = model;
  newState.total = model.paged.total;
  newState.pages = model.paged.more;
  newState.size = model.paged.size;
  newState.currentPage = model.paged.page;
  return newState;
}