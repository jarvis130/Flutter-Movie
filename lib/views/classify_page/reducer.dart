import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/classify_list_model.dart';
import 'package:movie/models/classify_list_model.dart' as prefix0;

import 'action.dart';
import 'state.dart';

Reducer<ClassifyPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassifyPageState>>{
      ClassifyPageAction.action: _onAction,
      ClassifyPageAction.setAccount:_setAccount,
      ClassifyPageAction.setList:_setList,
      ClassifyPageAction.loadMore:_loadMore,
      ClassifyPageAction.onEdit:_onEdit,
    },
  );
}

ClassifyPageState _onAction(ClassifyPageState state, Action action) {
  final ClassifyPageState newState = state.clone();
  return newState;
}

ClassifyPageState _setAccount(ClassifyPageState state, Action action) {
  String accountid=action.payload[0];
  final ClassifyPageState newState = state.clone();
  // newState.accountId=accountid;
  return newState;
}

ClassifyPageState _setList(ClassifyPageState state, Action action) {
  prefix0.ClassifyListModel model = action.payload ?? null;
  ClassifyPageState newState = state.clone();
  newState.classifyModel = model;
  return newState;
}

ClassifyPageState _loadMore(ClassifyPageState state, Action action) {
  ClassifyListModel model=action.payload;
  final ClassifyPageState newState = state.clone();
  // newState.myList.page=model.page;
  // newState.myList.results.addAll(model.results);
  return newState;
}

ClassifyPageState _onEdit(ClassifyPageState state, Action action) {
  final bool isEdit=action.payload;
  final ClassifyPageState newState = state.clone();
  // newState.isEdit=isEdit;
  return newState;
}
