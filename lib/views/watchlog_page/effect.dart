import 'dart:io';
import 'dart:convert';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/api/product_api.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/GoodProducts.dart';
import 'action.dart';
import 'state.dart';

Effect<WatchLogState> buildEffect() {
  return combineEffects(<Object, Effect<WatchLogState>>{
    WatchLogAction.action: _onAction,
    WatchLogAction.cellTapped: _cellTapped,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose
  });
}

void _onAction(Action action, Context<WatchLogState> ctx) {
}

Future _onInit(Action action, Context<WatchLogState> ctx) {
  ctx.state.scrollController = ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
        GoodProducts model;
        int currentPage = ctx.state.currentPage + 1;
        if(currentPage == 1){
//          model = await ProductApi.getWatchLog(page: currentPage);
//          if (model != null){
//            ctx.dispatch(WatchLogActionCreator.loadMore(model));
//          }
        }
      }
    });
  _loadData(action, ctx);
}

void _onDispose(Action action, Context<WatchLogState> ctx) {

  ctx.state.scrollController.dispose();
}


Future _loadData(Action action, Context<WatchLogState> ctx) async {

  //视频信息
//  GoodProducts model;
//  int currentPage = ctx.state.currentPage + 1;
//  if(currentPage == 1){
//    model = await ProductApi.getWatchLog(page: currentPage, per_page: GlobalConfig.PageSize);
//    if (model != null){
//      ctx.dispatch(WatchLogActionCreator.loadMore(model));
//    }
//  }

}

Future _cellTapped(Action action, Context<WatchLogState> ctx) async {
  Products d = action.payload;

  await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
    'movieid': d.id.toString(),
    'bgpic': d.defaultPhoto.thumb,
    'title': d.name,
    'posterpic': d.defaultPhoto.thumb
  });
}