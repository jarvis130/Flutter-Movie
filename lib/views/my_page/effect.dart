import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/my_api.dart';
import 'package:movie/models/videolist.dart';
import 'package:movie/models/concernlist.dart';
import 'action.dart';
import 'state.dart';

Effect<MyState> buildEffect() {
  return combineEffects(<Object, Effect<MyState>>{
    MyAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose
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

  var q = await MyApi.getFavoritesList(ApiHelper.uid, 1);
  if (q != null) ctx.dispatch(MyActionCreator.onInitFavorites(q));
  
  // var t = await ApiHelper.getTVOnTheAir();
  // if (t != null) ctx.dispatch(ComingPageActionCreator.onInitTVComing(t));
}

void _onDispose(Action action, Context<MyState> ctx) {
  ctx.state.favoritesController.dispose();
  ctx.state.concernsController.dispose();
}

Future _loadFavoritesMore(Action action, Context<MyState> ctx) async {
  VideoListModel q;

  // if (ctx.state.moviecoming.page == ctx.state.moviecoming.total_pages) return;
  // q = await ApiHelper.getMovieUpComing(page: ctx.state.moviecoming.page + 1);

  // if (q != null) ctx.dispatch(ComingPageActionCreator.onLoadMore(q));
}

Future _loadConcernMore(Action action, Context<MyState> ctx) async {
  VideoListModel q;
  // if (ctx.state.moviecoming.page == ctx.state.moviecoming.total_pages) return;
  // q = await ApiHelper.getMovieUpComing(page: ctx.state.moviecoming.page + 1);

  // if (q != null) ctx.dispatch(ComingPageActionCreator.onLoadMore(q));
}