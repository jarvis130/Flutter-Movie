import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/imagemodel.dart';
import 'package:movie/models/media_accountstatemodel.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/review.dart';
import 'package:movie/models/videomodel.dart';
import 'package:palette_generator/palette_generator.dart';

//TODO replace with your own action
enum MovieDetailPageAction {
  action,
  init,
  setbgcolor,
  setVideos,
  setImages,
  setReviews,
  setAccountState,
  recommendationTapped,
  castCellTapped,
  openMenu,
  showSnackBar,
  setRecommendMovie,
  reviewMore,
  onRefresh
}

class MovieDetailPageActionCreator {
  static Action onAction() {
    return const Action(MovieDetailPageAction.action);
  }

  static Action onInit(ProductModel model) {
    return Action(MovieDetailPageAction.init, payload: model);
  }

  static Action onsetColor(PaletteGenerator c) {
   return Action(MovieDetailPageAction.setbgcolor, payload: c);
  }
  static Action onSetImages(ImageModel c) {
    return Action(MovieDetailPageAction.setImages, payload: c);
  }

  static Action onSetReviews(CommentModel c) {
    return Action(MovieDetailPageAction.setReviews, payload: c);
  }
  static Action onSetVideos(VideoModel c) {
    return Action(MovieDetailPageAction.setVideos, payload: c);
  }
  static Action onRecommendationTapped(String movieid,String backpic) {
    return Action(MovieDetailPageAction.recommendationTapped, payload:[movieid,backpic]);
  }
  static Action onCastCellTapped(int peopleid,String profilePath,String profileName) {
    return Action(MovieDetailPageAction.castCellTapped, payload:[peopleid,profilePath,profileName]);
  }
  static Action onSetAccountState(MediaAccountStateModel model) {
    return Action(MovieDetailPageAction.setAccountState, payload:model);
  }
  static Action openMenu() {
    return Action(MovieDetailPageAction.openMenu);
  }
  static Action showSnackBar(String message) {
    return Action(MovieDetailPageAction.showSnackBar,payload: message);
  }
  static Action setRecommendMovie(MovieListModel d) {
    return Action(MovieDetailPageAction.setRecommendMovie,payload: d);
  }
  static Action onReviewMore(var videoid) {
    return Action(MovieDetailPageAction.reviewMore, payload: videoid);
  }
  static Action onRefresh() {
    return Action(MovieDetailPageAction.onRefresh);
  }
}
