import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/GoodProducts.dart';

class WatchLogState implements Cloneable<WatchLogState> {

  GoodProducts videoList;
  int currentPage;
  int total;
  int size;
  int pages;
  ScrollController scrollController;

  @override
  WatchLogState clone() {
    return WatchLogState()
      ..videoList=videoList
      ..scrollController=scrollController
      ..total = total
      ..currentPage = currentPage
      ..size = size
      ..pages = pages;
  }
}

WatchLogState initState(Map<String, dynamic> args) {
  WatchLogState state = WatchLogState();
  state.videoList = new GoodProducts();
  state.currentPage = 0;
  state.total = 0;
  state.size = 0;
  state.pages = 0;
  return state;
}
