import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import 'package:movie/models/concernlist.dart';

//TODO replace with your own action
enum MyAction { action, initFavorites,loadFavoritesMore,loadConcernMore, initConcern ,filterChanged }

class MyActionCreator {
  static Action onAction() {
    return const Action(MyAction.action);
  }

  static Action onInitFavorites(VideoListModel d) {
    return Action(MyAction.initFavorites, payload: d);
  }
  static Action onInitConcern(ConcernListModel d) {
    return Action(MyAction.initConcern, payload: d);
  }
  static Action onLoadFavoritesMore(VideoListModel d) {
    return Action(MyAction.loadFavoritesMore, payload: d);
  }
  static Action onLoadConcernMore(VideoListModel d) {
    return Action(MyAction.loadConcernMore, payload: d);
  }

}
