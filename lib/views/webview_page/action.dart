import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebPageAction { action }

class WebPageActionCreator {
  static Action onAction() {
    return const Action(WebPageAction.action);
  }
}
