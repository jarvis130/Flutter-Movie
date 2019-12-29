import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FavoritesAction { action, cellTapped }

class FavoritesActionCreator {
  static Action onAction() {
    return const Action(FavoritesAction.action);
  }

  static Action onCellTapped(String id, String bgpic, String title, String posterpic) {
    return Action(FavoritesAction.cellTapped,
        payload: [id, bgpic, title, posterpic]);
  }
}
