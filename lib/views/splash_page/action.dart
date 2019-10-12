import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SplashAction { action, goMain }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onGoMain() {
    return const Action(SplashAction.goMain);
  }
}
