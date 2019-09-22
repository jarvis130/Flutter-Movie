import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/classify_list_model.dart';

//TODO replace with your own action
enum ClassifyPageAction { action, setAccount, setList, loadMore, cellTapped, onEdit }

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
  static Action loadMore(ClassifyListModel list) {
    return Action(ClassifyPageAction.loadMore, payload: list);
  }
  static Action cellTapped(String classifyId) {
    return Action(ClassifyPageAction.cellTapped, payload: classifyId);
  }
}
