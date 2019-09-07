import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import '../../state.dart';

class SwiperState implements Cloneable<SwiperState> {

  VideoListModel movie;

  @override
  SwiperState clone() {
    return SwiperState()
    ..movie = movie;
  }
}

class SwiperConnector extends ConnOp<HomePageState, SwiperState> {
  @override
  SwiperState get(HomePageState state) {
    SwiperState mstate = SwiperState();
    mstate.movie = state.movie;
    return mstate;
  }
}
