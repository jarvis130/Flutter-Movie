import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/movielist.dart';
import '../../state.dart';

class RecommendMovieState implements Cloneable<RecommendMovieState> {
  MovieListModel recommendMovie;
  @override
  RecommendMovieState clone() {
    return RecommendMovieState()
    ..recommendMovie = recommendMovie;
  }
}

class RecommendMovieConnector extends ConnOp<HomePageState, RecommendMovieState> {
  @override
  RecommendMovieState get(RecommendMovieState state) {
    RecommendMovieState mstate = RecommendMovieState();
    mstate.recommendMovie = state.recommendMovie;

    return mstate;
  }
}
