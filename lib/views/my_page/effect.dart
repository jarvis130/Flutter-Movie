import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/my_api.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/concernlist.dart';
import 'action.dart';
import 'state.dart';

Effect<MyState> buildEffect() {
  return combineEffects(<Object, Effect<MyState>>{
    MyAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    MyAction.loadFavoritesMore: _loadFavoritesMore,
    MyAction.loadConcernMore: _loadConcernMore
  });
}

void _onAction(Action action, Context<MyState> ctx) {
}

Future _onInit(Action action, Context<MyState> ctx) async {

  ctx.state.favoritesController = new ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.favoritesController.position.pixels ==
          (ctx.state.favoritesController.position.maxScrollExtent);
      if (isBottom) {
        await _loadFavoritesMore(action, ctx);
      }
    });

  ctx.state.concernsController = new ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.concernsController.position.pixels ==
          ctx.state.concernsController.position.maxScrollExtent;
      if (isBottom) {
        await _loadConcernMore(action, ctx);
      }
    });

  await _loadFavoritesMore(action, ctx);
  await _loadConcernMore(action, ctx);
}

void _onDispose(Action action, Context<MyState> ctx) {
  ctx.state.favoritesController.dispose();
  ctx.state.concernsController.dispose();
}

void _loadFavoritesMore(Action action, Context<MyState> ctx) async {
  MovieListModel q;
  var t = ctx.state.favorites;
  if (t != null) {
    if (t.page != t.total_pages) {
      int page = t.page + 1;
      q = await MyApi.getFavoritesList(ApiHelper.uid, page: page);
      if (q != null) ctx.dispatch(MyActionCreator.setFavoritesState(q));
    }
  }
}

void _loadConcernMore(Action action, Context<MyState> ctx) async {
  ConcernListModel q;
  var c = ctx.state.concerns;
  if (c != null) {
    if (c.page == null || c.page != c.total_pages) {
      int page = 0;
      if(c.page == null){
        page = 1;
      }else{
        page = c.page + 1;
      }

      q = await MyApi.getFollowsList(ApiHelper.uid, ApiHelper.uid, page: page);
      if (q != null) ctx.dispatch(MyActionCreator.setConcernState(q));
    }
  }


}
