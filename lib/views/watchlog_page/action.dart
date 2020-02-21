import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/ProductModel.dart';
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

  static Action cellTapped(Product videos) {
    return Action(WatchLogAction.cellTapped,payload: videos);
  }

  static Action loadMore(GoodProducts model) {
    return Action(WatchLogAction.loadMore, payload: model);
  }
}
