import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayAction { action }

class PlayActionCreator {
  static Action onAction() {
    return const Action(PlayAction.action);
  }
}
