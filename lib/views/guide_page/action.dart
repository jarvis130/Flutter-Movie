import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GuideAction { action, goMain }

class GuideActionCreator {
  static Action onAction() {
    return const Action(GuideAction.action);
  }

  static Action onGoMain() {
    return const Action(GuideAction.goMain);
  }
}
