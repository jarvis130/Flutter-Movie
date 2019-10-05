import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ConcernAction { action }

class ConcernActionCreator {
  static Action onAction() {
    return const Action(ConcernAction.action);
  }
}
