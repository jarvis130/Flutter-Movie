import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecommendMovieAction { action, cellTapped }

class RecommendMovieActionCreator {
  static Action onAction() {
    return const Action(RecommendMovieAction.action);
  }

  static Action onCellTapped(
      int id, String bgpic, String title, String posterpic) {
    return Action(RecommendMovieAction.cellTapped,
        payload: [id, bgpic, title, posterpic]);
  }
}
