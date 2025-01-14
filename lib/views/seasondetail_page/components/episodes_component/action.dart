import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/episodemodel.dart';
import 'package:movie/models/seasondetail.dart';

//TODO replace with your own action
enum EpisodesAction { action,expansionOpen,cellTapped}

class EpisodesActionCreator {
  static Action onAction() {
    return const Action(EpisodesAction.action);
  }
  static Action onExpansionOpen(int index, bool opened) {
    return Action(EpisodesAction.expansionOpen,payload:[index,opened]);
  }
  static Action onCellTapped(Episode p) {
    return Action(EpisodesAction.cellTapped,payload:p);
  }
}
