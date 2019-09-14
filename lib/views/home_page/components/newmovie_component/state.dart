import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import '../../state.dart';

class NewMovieState implements Cloneable<NewMovieState> {

  VideoListModel movie;
  bool showmovie;

  @override
  NewMovieState clone() {
    return NewMovieState()
      ..movie = movie
      ..showmovie = showmovie;
  }
}

class NewMovieConnector extends ConnOp<HomePageState, NewMovieState> {
  @override
  NewMovieState get(HomePageState state) {
    NewMovieState mstate = NewMovieState();
    mstate.movie = state.movie;
    mstate.showmovie = state.showPopMovie;
    return mstate;
  }
}
