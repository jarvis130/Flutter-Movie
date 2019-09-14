import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videolist.dart';
import '../../state.dart';

class SwiperState implements Cloneable<SwiperState> {

  VideoListModel swiper;

  @override
  SwiperState clone() {
    return SwiperState()
    ..swiper = swiper;
  }
}

class SwiperConnector extends ConnOp<HomePageState, SwiperState> {
  @override
  SwiperState get(HomePageState state) {
    SwiperState mstate = SwiperState();
    mstate.swiper = state.swiper;
    return mstate;
  }
}
