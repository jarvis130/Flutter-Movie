import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/concernlist.dart';
import 'package:movie/models/videolist.dart';

class MyState implements Cloneable<MyState> {

  VideoListModel favorites;
  ConcernListModel concerns;
  ScrollController favoritesController;
  ScrollController concernsController;

  @override
  MyState clone() {
    return MyState()
    ..favorites = favorites
    ..concerns = concerns
    ..favoritesController = favoritesController
    ..concernsController = concernsController;
  }
}

MyState initState(Map<String, dynamic> args) {
  var state = MyState();
  state.favorites = VideoListModel.fromParams(results:List<VideoListResult>());
  state.concerns = ConcernListModel.fromParams(results: List<ConcernListResult>());
  return state;
}
