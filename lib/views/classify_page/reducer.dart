import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClassifyPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassifyPageState>>{
      ClassifyPageAction.action: _onAction,
      ClassifyPageAction.setAccount:_setAccount,
      ClassifyPageAction.loadMore:_loadMore,
      ClassifyPageAction.init: _init,
      ClassifyPageAction.updateGroupValue: _updateGroupValue
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

ClassifyPageState _loadMore(ClassifyPageState state, Action action) {
  GoodProducts model=action.payload;
  final ClassifyPageState newState = state.clone();
  if(model != null){

    newState.productList.addAll(model.products);

    newState.total = model.paged.total;
    newState.pages = model.paged.more;
    newState.size = model.paged.size;
    newState.currentPage = model.paged.page;
  }
  //保留默认查询条件
//  newState.atrributionList1 = state.atrributionList1;
//  newState.atrributionList2 = state.atrributionList2;
//  newState.atrributionList3 = state.atrributionList3;
//  newState.groupValue1 = state.groupValue1;
//  newState.groupValue2 = state.groupValue2;
//  newState.groupValue3 = state.groupValue3;
  return newState;
}

ClassifyPageState _updateGroupValue(ClassifyPageState state, Action action) {

  final ClassifyPageState newState = state.clone();
  //保留查询条件
//  newState.atrributionList1 = state.atrributionList1;
//  newState.atrributionList2 = state.atrributionList2;
//  newState.atrributionList3 = state.atrributionList3;
//  newState.groupValue1 = state.groupValue1;
//  newState.groupValue2 = state.groupValue2;
//  newState.groupValue3 = state.groupValue3;
  //用户选择
  Map map = action.payload;
  if(map['group'] == 1){
    newState.groupTitle1 =  map['title'];
    newState.groupValue1 =  map['value'];
  }else if(map['group'] == 2){
    newState.groupTitle2 =  map['title'];
    newState.groupValue2 =  map['value'];
  }else{
    newState.groupTitle3 =  map['title'];
    newState.groupValue3 =  map['value'];
  }
  //计算查询结果
//  GoodProducts model = map['result'];
//  if(model != null){
//    newState.productList = model.products;
//    newState.total = model.paged.total;
//    newState.pages = model.paged.more;
//    newState.size = model.paged.size;
//    newState.currentPage = model.paged.page;
//  }
  return newState;
}

ClassifyPageState _init(ClassifyPageState state, Action action) {
  List list1 = action.payload['list1'];
  List list2 = action.payload['list2'];
  List list3 = action.payload['list3'];
  final ClassifyPageState newState = state.clone();
  newState.atrributionList1 = list1;
  newState.atrributionList2 = list2;
  newState.atrributionList3 = list3;
  newState.groupValue1 = 0;
  newState.groupValue2 = 0;
  newState.groupValue3 = 0;
  return newState;
}
