import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ConcernAction { action, attention, cellTapped, cellTappedToListDetail }

class ConcernActionCreator {
  static Action onAction() {
    return const Action(ConcernAction.action);
  }

  static Action onCellTapped(int id, String bgpic, String title, String posterpic) {
    return Action(ConcernAction.cellTapped,
        payload: [id, bgpic, title, posterpic]);
  }

  static Action onCellTappedToListDetail(String id) {
    return Action(ConcernAction.cellTappedToListDetail,
        payload: id);
  }

}