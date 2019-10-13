import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HotMovieAction { action, cellTapped }

class HotMovieActionCreator {
  static Action onAction() {
    return const Action(HotMovieAction.action);
  }

  static Action onCellTapped(
      String id, String bgpic, String title, String posterpic) {
    return Action(HotMovieAction.cellTapped,
        payload: [id, bgpic, title, posterpic]);
  }
}
