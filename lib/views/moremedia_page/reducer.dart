import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';

import 'action.dart';
import 'state.dart';

Reducer<MoreMediaPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MoreMediaPageState>>{
      MoreMediaPageAction.action: _onAction,
      MoreMediaPageAction.loadMore:_loadMore
    },
  );
}

MoreMediaPageState _onAction(MoreMediaPageState state, Action action) {
  final MoreMediaPageState newState = state.clone();
  return newState;
}

MoreMediaPageState _loadMore(MoreMediaPageState state, Action action) {
  final GoodProducts model =action.payload??GoodProducts();
  final MoreMediaPageState newState = state.clone();
  newState.goodProducts.addAll(model.products);
  newState.total = model.paged.total;
  newState.pages = model.paged.more;
  newState.size = model.paged.size;
  newState.currentPage = model.paged.page;
  return newState;
}
