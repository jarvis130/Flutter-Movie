import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/CommentModel.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReviewState>>{
      ReviewAction.action: _onAction,
      ReviewAction.loadmore: _loadMore
    },
  );
}

ReviewState _onAction(ReviewState state, Action action) {
  final ReviewState newState = state.clone();
  return newState;
}

ReviewState _loadMore(ReviewState state, Action action) {
  final CommentModel model =action.payload??CommentModel();
  final ReviewState newState = state.clone();
  newState.reviewModel.reviews.addAll(model.reviews);
  newState.total = model.paged.total;
  newState.pages = model.paged.more;
  newState.size = model.paged.size;
  newState.currentPage = model.paged.page;
  return newState;
}

