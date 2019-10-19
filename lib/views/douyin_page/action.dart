import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DouyinPageAction { action }

class DouyinPageActionCreator {
  static Action onAction() {
    return const Action(DouyinPageAction.action);
  }
}
