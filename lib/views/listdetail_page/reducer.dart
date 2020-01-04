import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserDetailModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListDetailPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListDetailPageState>>{
      ListDetailPageAction.action: _onAction,
      ListDetailPageAction.setListDetail:_setListDetail,
      ListDetailPageAction.loadMore:_loadMore,
      ListDetailPageAction.setSort:_setSort,
      ListDetailPageAction.updateUserInfo:_updateUserInfo,
    },
  );
}

ListDetailPageState _onAction(ListDetailPageState state, Action action) {
  final ListDetailPageState newState = state.clone();
  return newState;
}

ListDetailPageState _setListDetail(ListDetailPageState state, Action action) {
  final UserDetailModel model=action.payload??ListDetailModel.fromParams(results: []);
  final ListDetailPageState newState = state.clone();
//  newState.userDetailModel=model;
  return newState;
}

ListDetailPageState _loadMore(ListDetailPageState state, Action action) {
  final GoodProducts model = action.payload  ?? new GoodProducts();
  final ListDetailPageState newState = state.clone();
  newState.videoList = model;
  newState.total = model.paged.total;
  newState.pages = model.paged.more;
  newState.size = model.paged.size;
  newState.currentPage = model.paged.page;
  return newState;
}

ListDetailPageState _updateUserInfo(ListDetailPageState state, Action action) {
  final UserModel model = action.payload ?? new UserModel();
  final ListDetailPageState newState = state.clone();
  newState.userDetailModel = model;
  return newState;
}

ListDetailPageState _setSort(ListDetailPageState state, Action action) {
  final SortCondition model=action.payload;
  final ListDetailPageState newState = state.clone();
  int index=state.sortBy.indexOf(model);
  newState.sortBy.forEach((f){f.isSelected=false;});
  newState.sortBy[index].isSelected=true;
  newState.sortType=model.value;
//  newState.userDetailModel = ;
  return newState;
}