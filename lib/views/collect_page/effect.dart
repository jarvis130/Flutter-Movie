import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/api/collect_api.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectState> buildEffect() {
  return combineEffects(<Object, Effect<CollectState>>{
    MyAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    MyAction.loadFavoritesMore: _loadFavoritesMore,
    MyAction.loadConcernMore: _loadConcernMore,
    MyAction.loadFavorites: _loadFavorites,
    MyAction.loadConcern: _loadConcern
  });
}

void _onAction(Action action, Context<CollectState> ctx) {
}

Future _onInit(Action action, Context<CollectState> ctx) async {

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

  await _loadFavorites(action, ctx);
  await _loadConcern(action, ctx);
}

void _onDispose(Action action, Context<CollectState> ctx) {
  ctx.state.favoritesController.dispose();
  ctx.state.concernsController.dispose();
}

void _loadFavoritesMore(Action action, Context<CollectState> ctx) async {
  GoodProducts q;
  var t = ctx.state.favorites;
  if (t != null) {
    if (t.paged.page != t.paged.more) {
      int page = t.paged.page + 1;
      q = await CollectApi.getFavoritesList(page: page);
      if (q != null) ctx.dispatch(MyActionCreator.setFavoritesState(q));
    }
  }
}

void _loadConcernMore(Action action, Context<CollectState> ctx) async {
  UserListModel q;
  var c = ctx.state.userListModel;
  if (c != null) {
    if (c.paged.page == null || c.paged.page != c.paged.more) {
      int page = 0;
      if(c.paged.page == null){
        page = 1;
      }else{
        page = c.paged.page + 1;
      }

      q = await CollectApi.getFollowsList(page: page);
      if (q != null) ctx.dispatch(MyActionCreator.setConcernState(q));
    }
  }
}

void _loadFavorites(Action action, Context<CollectState> ctx) async {
  GoodProducts  q = await CollectApi.getFavoritesList(page: 1);
  if (q != null) ctx.dispatch(MyActionCreator.setFavoritesState(q));
}

void _loadConcern(Action action, Context<CollectState> ctx) async {
  UserListModel q = await CollectApi.getFollowsList(page: 1);
  if (q != null) ctx.dispatch(MyActionCreator.setConcernState(q));

}
