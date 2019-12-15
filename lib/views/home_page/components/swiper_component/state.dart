import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/swiperlist.dart';
import '../../state.dart';

class SwiperState implements Cloneable<SwiperState> {

  BannerModel swiper;

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
