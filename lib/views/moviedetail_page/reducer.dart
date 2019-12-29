
import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/imagemodel.dart';
import 'package:movie/models/media_accountstatemodel.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/review.dart';
import 'package:movie/models/videomodel.dart';
import 'package:palette_generator/palette_generator.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieDetailPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieDetailPageState>>{
      MovieDetailPageAction.action: _onAction,
      MovieDetailPageAction.init:_onInit,
      MovieDetailPageAction.setbgcolor:_onSetColor,
      MovieDetailPageAction.setImages:_onSetImages,
      MovieDetailPageAction.setReviews:_onSetReviews,
      MovieDetailPageAction.setVideos:_onSetVideos,
      MovieDetailPageAction.setAccountState:_onSetAccountState,
      MovieDetailPageAction.setRecommendMovie: _onSetRecommendMovie
    },
  );
}

MovieDetailPageState _onAction(MovieDetailPageState state, Action action) {
  final MovieDetailPageState newState = state.clone();
  return newState;
}
MovieDetailPageState _onInit(MovieDetailPageState state, Action action) {
  ProductModel model=action.payload??new ProductModel();
  final MovieDetailPageState newState = state.clone();
  newState.movieDetailModel=model;
//  newState.backdropPic=model.product.defaultPhoto.thumb;
//  newState.posterPic=model.product.defaultPhoto.thumb;
//  newState.title=model.product.name;
  return newState;
}
MovieDetailPageState _onSetColor(MovieDetailPageState state, Action action) {
  PaletteGenerator c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.palette=c;
  return newState;
}
MovieDetailPageState _onSetImages(MovieDetailPageState state, Action action) {
  ImageModel c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.imagesmodel=c;
  return newState;
}
MovieDetailPageState _onSetReviews(MovieDetailPageState state, Action action) {
  ReviewModel c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.reviewModel=c;
  return newState;
}
MovieDetailPageState _onSetVideos(MovieDetailPageState state, Action action) {
  VideoModel c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.videomodel=c;
  return newState;
}
MovieDetailPageState _onSetAccountState(MovieDetailPageState state, Action action) {
  MediaAccountStateModel c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.accountState=c;
  return newState;
}
MovieDetailPageState _onSetRecommendMovie(MovieDetailPageState state, Action action) {
  MovieListModel c=action.payload;
  final MovieDetailPageState newState = state.clone();
  newState.recommendMovie=c;
  return newState;
}