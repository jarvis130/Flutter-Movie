import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/models/movielist.dart';
import '../../state.dart';

class HotMovieState implements Cloneable<HotMovieState> {

  List<Products> hotMovie;

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
    mstate.hotMovie = state.hotModel;

    return mstate;
  }
}
