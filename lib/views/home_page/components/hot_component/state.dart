import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/movielist.dart';
import '../../state.dart';

class HotMovieState implements Cloneable<HotMovieState> {

  MovieListModel hotMovie;

  @override
  HotMovieState clone() {
    return HotMovieState()
    ..hotMovie = hotMovie;
  }
}

class HotMovieConnector extends ConnOp<HomePageState, HotMovieState> {
  @override
  HotMovieState get(HomePageState state) {
    HotMovieState mstate = HotMovieState();
    mstate.hotMovie = state.hotMovie;

    return mstate;
  }
}
