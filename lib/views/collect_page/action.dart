import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/concernlist.dart';

//TODO replace with your own action
enum MyAction {
  action,
  setFavoritesState,
  loadFavorites,
  loadConcern,
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

  static Action onLoadFavorites() {
    return Action(MyAction.loadFavorites);
  }
  static Action onLoadConcern() {
    return Action(MyAction.loadConcern);
  }

  static Action setFavoritesState(MovieListModel d) {
    return Action(MyAction.setFavoritesState, payload: d);
  }
  static Action setConcernState(ConcernListModel d) {
    return Action(MyAction.setConcernState, payload: d);
  }
}