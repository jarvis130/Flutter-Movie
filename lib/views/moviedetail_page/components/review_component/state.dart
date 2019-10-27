import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/review.dart';
import '../../state.dart';

class ReviewState implements Cloneable<ReviewState> {

  ReviewModel reviewModel;
  String movieid;

  @override
  ReviewState clone() {
    return ReviewState()
    ..reviewModel = reviewModel
    ..movieid = movieid;
  }
}

class ReviewConnector extends ConnOp<MovieDetailPageState, ReviewState>{
  @override
  ReviewState get(MovieDetailPageState state) {
    ReviewState substate = new ReviewState();
    substate.reviewModel = state.reviewModel;
    substate.movieid = state.movieid;
    return substate;
  }

}
