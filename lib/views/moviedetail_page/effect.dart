import 'dart:convert' show json;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/api/comment_api.dart';
import 'package:movie/widgets/custom_stfstate.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'action.dart';
import 'state.dart';

Effect<MovieDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<MovieDetailPageState>>{
    MovieDetailPageAction.action: _onAction,
    MovieDetailPageAction.recommendationTapped: _onRecommendationTapped,
    MovieDetailPageAction.castCellTapped: _onCastCellTapped,
    MovieDetailPageAction.openMenu: _openMenu,
    MovieDetailPageAction.showSnackBar: _showSnackBar,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    MovieDetailPageAction.reviewMore: _reviewMore,
    MovieDetailPageAction.onRefresh: _onRefresh,
  });
}

void _onAction(Action action, Context<MovieDetailPageState> ctx) {}

Future _onInit(Action action, Context<MovieDetailPageState> ctx) async {
  try {
    final ticker = ctx.stfState as CustomstfState;
    ctx.state.animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 1000));


    //
    _loadMore(action, ctx);
    // 评论
    _reviewMore(action, ctx);

//    ctx.state.scrollController = ScrollController()
//      ..addListener(() {
//        bool isBottom = ctx.state.scrollController.position.pixels ==
//            ctx.state.scrollController.position.maxScrollExtent;
//        if (isBottom) {
//          _loadMore(action, ctx);
//        }
//      });
  } on Exception catch (e) {}
}

void _loadMore(Action action, Context<MovieDetailPageState> ctx) async {
  // 视频详情
  ProductModel r = await MovieDetailApi.getMovieDetail(ctx.state.movieid);
  if (r != null) {
    ctx.dispatch(MovieDetailPageActionCreator.onInit(r));
    ctx.state.animationController.forward();
  }
}

Future _onDispose(Action action, Context<MovieDetailPageState> ctx) {
  ctx.state.scrollController.dispose();
}

Future _onRefresh(Action action, Context<MovieDetailPageState> ctx) async {
  _loadMore(action, ctx);
  _reviewMore(action, ctx);
}

Future _onRecommendationTapped(
    Action action, Context<MovieDetailPageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('moviedetailpage',
      arguments: {'movieid': action.payload[0], 'bgpic': action.payload[1]});
}

Future _onCastCellTapped(
    Action action, Context<MovieDetailPageState> ctx) async {
  await Navigator.of(ctx.context).pushNamed('peopledetailpage', arguments: {
    'peopleid': action.payload[0],
    'profilePath': action.payload[1],
    'profileName': action.payload[2]
  });
}

void _openMenu(Action action, Context<MovieDetailPageState> ctx) {
  showModalBottomSheet(
      context: ctx.context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ctx.buildComponent('menu');
      });
}

void _showSnackBar(Action action, Context<MovieDetailPageState> ctx) {
  ctx.state.scaffoldkey.currentState.showSnackBar(SnackBar(
    content: Text(action.payload ?? ''),
  ));
}

void _reviewMore(Action action, Context<MovieDetailPageState> ctx) async{
  CommentModel reviewModel = await CommentApi.getList(
    product: int.parse(ctx.state.movieid),
    page: 1,
    per_page: GlobalConfig.PageSize
  );
  if (reviewModel != null) {
    ctx.dispatch(MovieDetailPageActionCreator.onSetReviews(reviewModel));
  }
}
