import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NewMovieAction { action, cellTapped }

class NewMovieActionCreator {
  static Action onAction() {
    return const Action(NewMovieAction.action);
  }
  static Action onCellTapped(String id,String bgpic,String title,String posterpic) {
    return Action(NewMovieAction.cellTapped,payload:[id,bgpic,title,posterpic]);
  }
}
