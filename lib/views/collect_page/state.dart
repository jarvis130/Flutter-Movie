import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/concernlist.dart';
import 'package:movie/models/movielist.dart';

class CollectState implements Cloneable<CollectState> {

  MovieListModel favorites;
  ConcernListModel concerns;
  ScrollController favoritesController;
  ScrollController concernsController;

  @override
  CollectState clone() {
    return CollectState()
    ..favorites = favorites
    ..concerns = concerns
    ..favoritesController = favoritesController
    ..concernsController = concernsController;
  }
}

CollectState initState(Map<String, dynamic> args) {
  var state = CollectState();
  state.favorites = MovieListModel.fromParams(results:List<MovieListResult>());
  state.concerns = ConcernListModel.fromParams(results: List<ConcernListResult>());
  return state;
}
