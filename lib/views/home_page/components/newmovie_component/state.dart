import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/models/movielist.dart';
import '../../state.dart';

class NewMovieState implements Cloneable<NewMovieState> {

  List<Products> newMovie;

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
    mstate.newMovie = state.newModel;
    return mstate;
  }
}
