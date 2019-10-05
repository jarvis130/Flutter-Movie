import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import 'package:flutter/widgets.dart';
import '../../state.dart';

class FavoritesState implements Cloneable<FavoritesState> {

  VideoListModel favoritesList;
  ScrollController movieController;

  @override
  FavoritesState clone() {
    return FavoritesState()
    ..favoritesList = favoritesList
    ..movieController = movieController;
  }
}

class FavoritesConnector extends ConnOp<MyState, FavoritesState>{
  @override
  FavoritesState get(MyState state) {
    FavoritesState substate = new FavoritesState();
    substate.favoritesList = state.favorites;
    substate.movieController = state.favoritesController;
    return substate;
  }
}