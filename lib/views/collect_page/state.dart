import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';

class CollectState implements Cloneable<CollectState> {

  GoodProducts favorites;
  UserListModel userListModel;
  ScrollController favoritesController;
  ScrollController concernsController;

  @override
  CollectState clone() {
    return CollectState()
    ..favorites = favorites
    ..userListModel = userListModel
    ..favoritesController = favoritesController
    ..concernsController = concernsController;
  }
}

CollectState initState(Map<String, dynamic> args) {
  var state = CollectState();
  state.favorites = new GoodProducts();
  state.userListModel = new UserListModel();
  return state;
}
