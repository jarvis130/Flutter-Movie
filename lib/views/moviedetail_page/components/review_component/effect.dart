import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/api/comment_api.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/CommentModel.dart';

import 'action.dart';
import 'state.dart';

Effect<ReviewState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewState>>{
    ReviewAction.action: _onAction,
    ReviewAction.openReview: _onOpenReview,
  });
}

void _onAction(Action action, Context<ReviewState> ctx) {
}

void _onOpenReview(Action action, Context<ReviewState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('CommentPage', arguments: {
    'videoid': action.payload
  });
}

void _onInit(Action action, Context<ReviewState> ctx) {

  ctx.state.scrollController = ScrollController()
    ..addListener(() {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
        _loadMore(action, ctx);
      }
    });

  _initLoad(action, ctx);
}

void _onDispose(Action action, Context<ReviewState> ctx) {
  ctx.state.scrollController.dispose();
}

Future _initLoad(Action action, Context<ReviewState> ctx) async {
  ctx.state.currentPage = 1;
  _loadMore(action, ctx);
}

Future _loadMore(Action action, Context<ReviewState> ctx) async {
  CommentModel model;
  int currentPage = ctx.state.currentPage + 1;
  if (currentPage <= ctx.state.pages) {
    model = await CommentApi.getList(
        page: currentPage,
        per_page: GlobalConfig.PageSize,
        product: ctx.state.movieid
    );
  }

  if (model != null){
    ctx.dispatch(ReviewActionCreator.loadMore(model));
  }
}