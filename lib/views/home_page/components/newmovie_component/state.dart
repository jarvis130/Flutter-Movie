import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/movielist.dart';
import '../../state.dart';

class NewMovieState implements Cloneable<NewMovieState> {

  MovieListModel newMovie;

  @override
  NewMovieState clone() {
    return NewMovieState()
      ..newMovie = newMovie;
  }
}

class NewMovieConnector extends ConnOp<HomePageState, NewMovieState> {
  @override
  NewMovieState get(HomePageState state) {
    NewMovieState mstate = NewMovieState();
    mstate.newMovie = state.newMovie;
    return mstate;
  }
}
