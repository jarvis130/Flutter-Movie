import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/api/product_api.dart';
import 'package:movie/widgets/custom_stfstate.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/enums/media_type.dart';
import 'action.dart';
import 'state.dart';

Effect<MoreMediaPageState> buildEffect() {
  return combineEffects(<Object, Effect<MoreMediaPageState>>{
    MoreMediaPageAction.action: _onAction,
    MoreMediaPageAction.cellTapped: _cellTapped,
    MoreMediaPageAction.onRefresh: _onRefresh,
    Lifecycle.initState: _onInit,
    Lifecycle.build:_onBuild,
    Lifecycle.dispose:_onDispose
  });
}

void _onInit(Action action, Context<MoreMediaPageState> ctx) {
  ctx.state.scrollController = ScrollController()
    ..addListener(() {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
        _loadMore(action, ctx);
      }
    });

    final TickerProvider tickerProvider = ctx.stfState as CustomstfState;
    ctx.state.animationController=AnimationController(
      vsync: tickerProvider, duration: Duration(milliseconds: 300*ctx.state.goodProducts.length)
    );

  _initLoad(action, ctx);
}

void _onBuild(Action action, Context<MoreMediaPageState> ctx) {
 Future.delayed(const Duration(milliseconds: 200),()=> ctx.state.animationController.forward());
}
void _onDispose(Action action, Context<MoreMediaPageState> ctx) {
  ctx.state.animationController.stop(canceled: false);
  ctx.state.animationController.dispose();
  ctx.state.scrollController.dispose();
}
void _onAction(Action action, Context<MoreMediaPageState> ctx) {}

Future _initLoad(Action action, Context<MoreMediaPageState> ctx) async {
  ctx.state.currentPage = 1;
  _loadMore(action, ctx);
}

Future _loadMore(Action action, Context<MoreMediaPageState> ctx) async {
  GoodProducts model;
  int currentPage = ctx.state.currentPage + 1;
  if (currentPage <= ctx.state.pages) {
    if (ctx.state.mediaType == MediaType.hot)
      model = await ProductApi.getList(page: currentPage, is_hot: 1);
    else if (ctx.state.mediaType == MediaType.recommend)
      model = await ProductApi.getList( page: currentPage, is_best: 1);
    else
      model = await ProductApi.getList(page: currentPage, is_new: 1);
  }

  if (model != null){
    ctx.dispatch(MoreMediaPageActionCreator.loadMore(model));
  }
}

Future _cellTapped(Action action, Context<MoreMediaPageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
    'movieid': action.payload[0],
    'bgpic': action.payload[2],
    'title': action.payload[1],
    'posterpic': action.payload[3]
  });
}

Future _onRefresh(Action action, Context<MoreMediaPageState> ctx) async {
  ctx.state.currentPage = 0;
  _loadMore(action, ctx);
}
