import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/models/CommentModel.dart';
import '../../state.dart';

class ReviewState implements Cloneable<ReviewState> {

  CommentModel reviewModel;
  int movieid;
  int currentPage;
  int total;
  int size;
  int pages;
  ScrollController scrollController;

  @override
  ReviewState clone() {
    return ReviewState()
    ..reviewModel = reviewModel
    ..movieid = movieid
    ..scrollController=scrollController
    ..total = total
    ..currentPage = currentPage
    ..size = size
    ..pages = pages;
  }
}

class ReviewConnector extends ConnOp<MovieDetailPageState, ReviewState>{
  @override
  ReviewState get(MovieDetailPageState state) {
    ReviewState substate = new ReviewState();
    substate.scrollController = state.scrollController;
    substate.reviewModel = state.reviewModel;
    substate.movieid = int.parse(state.movieid);
    substate.currentPage = state.currentPage;
    substate.total = state.total;
    substate.size = state.size;
    substate.pages = state.pages;
    return substate;
  }

}

