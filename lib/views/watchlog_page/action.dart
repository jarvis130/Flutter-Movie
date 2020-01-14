import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';

//TODO replace with your own action
enum WatchLogAction {
  action,
  loadMore,
  cellTapped
}

class WatchLogActionCreator {
  static Action onAction() {
    return const Action(WatchLogAction.action);
  }

  static Action cellTapped(Products videos) {
    return Action(WatchLogAction.cellTapped,payload: videos);
  }

  static Action loadMore(GoodProducts model) {
    return Action(WatchLogAction.loadMore, payload: model);
  }
}
