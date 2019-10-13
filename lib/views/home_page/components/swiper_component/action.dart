import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SwiperAction { action, cellTapped }

class SwiperActionCreator {
  static Action onAction() {
    return const Action(SwiperAction.action);
  }

  static Action onCellTapped(String id,String bgpic,String title,String posterpic) {
    return Action(SwiperAction.cellTapped, payload:[id,bgpic,title,posterpic]);
  }
}
