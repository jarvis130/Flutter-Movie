import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import 'package:movie/models/concernlist.dart';

//TODO replace with your own action
enum MyAction {
  action,
  setFavoritesState,
  loadFavoritesMore,
  loadConcernMore,
  setConcernState ,
  filterChanged
}

class MyActionCreator {
  static Action onAction() {
    return const Action(MyAction.action);
  }

  static Action onLoadFavoritesMore() {
    return Action(MyAction.loadFavoritesMore);
  }
  static Action onLoadConcernMore() {
    return Action(MyAction.loadConcernMore);
  }

  static Action setFavoritesState(VideoListModel d) {
    return Action(MyAction.setFavoritesState, payload: d);
  }
  static Action setConcernState(ConcernListModel d) {
    return Action(MyAction.setConcernState, payload: d);
  }
}
