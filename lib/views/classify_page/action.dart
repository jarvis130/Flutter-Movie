import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/classify_list_model.dart';

//TODO replace with your own action
enum ClassifyPageAction {
  action,
  setAccount,
  setList,
  loadMore,
  cellTapped,
  onUpdateGroupValue,
  updateGroupValue,
  init
}

class ClassifyActionCreator {
  static Action onAction() {
    return const Action(ClassifyPageAction.action);
  }
  static Action setAccount(String accountid) {
    return Action(ClassifyPageAction.setAccount, payload: accountid);
  }
  static Action setList(ClassifyListModel model) {
    return Action(ClassifyPageAction.setList, payload: model);
  }
  static Action loadMore(GoodProducts model) {
    return Action(ClassifyPageAction.loadMore, payload: model);
  }
  static Action cellTapped(String id,String title,String bgpic,String posterpic) {
    return Action(ClassifyPageAction.cellTapped, payload:[id,title,bgpic,posterpic]);
  }
  static Action onUpdateGroupValue(Map map) {
    return Action(ClassifyPageAction.onUpdateGroupValue, payload: map);
  }
  static Action updateGroupValue(Map map) {
    return Action(ClassifyPageAction.updateGroupValue, payload: map);
  }
  static Action init(Map map) {
    return  Action(ClassifyPageAction.init, payload: map);
  }
}
