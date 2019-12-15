import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/HomeModel.dart';
import '../../state.dart';

class RecommendMovieState implements Cloneable<RecommendMovieState> {
  List<Products> recommendMovie;

  @override
  RecommendMovieState clone() {
    return RecommendMovieState()
    ..recommendMovie = recommendMovie;
  }
}

class RecommendMovieConnector extends ConnOp<HomePageState, RecommendMovieState> {
  @override
  RecommendMovieState get(HomePageState state) {
    RecommendMovieState mstate = RecommendMovieState();
    mstate.recommendMovie = state.recommendModel;
    return mstate;
  }
}
