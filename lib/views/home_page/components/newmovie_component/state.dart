import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/ProductModel.dart';
import '../../state.dart';

class NewMovieState implements Cloneable<NewMovieState> {

  List<Product> newMovie;

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
