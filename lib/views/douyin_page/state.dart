import 'package:fish_redux/fish_redux.dart';
import 'package:flukit/flukit.dart';

class DouyinPageState implements Cloneable<DouyinPageState> {

  SwiperController swiperController = SwiperController();

  @override
  DouyinPageState clone() {
    return DouyinPageState()
    ..swiperController = swiperController;
  }
}

DouyinPageState initState(Map<String, dynamic> args) {
  return DouyinPageState();
}
