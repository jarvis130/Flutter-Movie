import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';
import 'action.dart';
import 'state.dart';

Reducer<UserPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPageState>>{
      UserPageAction.action: _onAction,
      UserPageAction.setListDetail:_setListDetail,
      UserPageAction.loadMore:_loadMore,
      UserPageAction.setSort:_setSort,
    },
  );
}

UserPageState _onAction(UserPageState state, Action action) {
  final UserPageState newState = state.clone();
  return newState;
}


UserPageState _setListDetail(UserPageState state, Action action) {
  final UserModel model=action.payload??ListDetailModel.fromParams(results: []);
  final UserPageState newState = state.clone();
  newState.userModel=model;
  return newState;
}

UserPageState _loadMore(UserPageState state, Action action) {
  final UserModel model=action.payload ?? new UserModel();
  final UserPageState newState = state.clone();
  newState.userModel = model;
//  newState.listDetailModel.results.addAll(model.results);
  // newState.listDetailModel.page=model.page??newState.listDetailModel.page;
  return newState;
}

UserPageState _setSort(UserPageState state, Action action) {
  final SortCondition model=action.payload;
  final UserPageState newState = state.clone();
  int index=state.sortBy.indexOf(model);
  newState.sortBy.forEach((f){f.isSelected=false;});
  newState.sortBy[index].isSelected=true;
  newState.sortType=model.value;
//  newState.UserModel.results=[];
  return newState;
}