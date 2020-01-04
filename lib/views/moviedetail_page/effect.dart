import 'dart:convert' show json;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/review_api.dart';
import 'package:movie/customwidgets/custom_stfstate.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:movie/models/review.dart';
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
    MovieDetailPageAction.reviewMore: _reviewMore,
  });
}

void _onAction(Action action, Context<MovieDetailPageState> ctx) {}

Future _onInit(Action action, Context<MovieDetailPageState> ctx) async {
  try {
    final ticker = ctx.stfState as CustomstfState;
    ctx.state.animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 1000));
    ctx.state.scrollController = new ScrollController();

    // 视频详情
    ProductModel r = await MoiveDetailApi.getMovieDetail(ctx.state.movieid);
    if (r != null) {
        ctx.dispatch(MovieDetailPageActionCreator.onInit(r));
        ctx.state.animationController.forward();
    }

    //

    // 评论
    _reviewMore(action, ctx);

    // var accountstate = await ApiHelper.getMovieAccountState(ctx.state.movieid);
    // if (accountstate != null)
    //   ctx.dispatch(
    //       MovieDetailPageActionCreator.onSetAccountState(accountstate));
    // var l = await ApiHelper.getMovieReviews(ctx.state.movieid);
    // if (l != null) ctx.dispatch(MovieDetailPageActionCreator.onSetReviews(l));
    // var k = await ApiHelper.getMovieImages(ctx.state.movieid);
    // if (k != null) ctx.dispatch(MovieDetailPageActionCreator.onSetImages(k));
    // var f = await ApiHelper.getMovieVideo(ctx.state.movieid);
    // if (f != null) ctx.dispatch(MovieDetailPageActionCreator.onSetVideos(f));
  } on Exception catch (e) {}
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
  ReviewModel reviewModel = await ReviewApi.getGetComments(ApiHelper.uid, ctx.state.movieid, page:1);
  if (reviewModel != null) {
    ctx.dispatch(MovieDetailPageActionCreator.onSetReviews(reviewModel));
  }
}
