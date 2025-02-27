import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/tvdetail.dart';

//TODO replace with your own action
enum TVListAction { action,loadSeason ,updateSeason}

class TVListActionCreator {
  static Action onAction() {
    return const Action(TVListAction.action);
  }
  static Action onLoadSeason(int i) {
    return Action(TVListAction.loadSeason,payload:i);
  }
  static Action onUpdateSeason(int i,TVDetailModel d) {
    return Action(TVListAction.updateSeason,payload:[i, d]);
  }
  
}
