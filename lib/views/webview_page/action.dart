import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebPageAction { action, setUsername }

class WebPageActionCreator {
  static Action onAction() {
    return const Action(WebPageAction.action);
  }
  static Action setUsername(String username) {
    return  Action(WebPageAction.setUsername, payload: username);
  }
}
