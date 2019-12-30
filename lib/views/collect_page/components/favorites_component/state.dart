import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:flutter/widgets.dart';
import '../../state.dart';

class FavoritesState implements Cloneable<FavoritesState> {

  GoodProducts favoritesList;
  ScrollController movieController;

  @override
  FavoritesState clone() {
    return FavoritesState()
    ..favoritesList = favoritesList
    ..movieController = movieController;
  }
}

class FavoritesConnector extends ConnOp<CollectState, FavoritesState>{
  @override
  FavoritesState get(CollectState state) {
    FavoritesState substate = new FavoritesState();
    substate.favoritesList = state.favorites;
    substate.movieController = state.favoritesController;
    return substate;
  }
}