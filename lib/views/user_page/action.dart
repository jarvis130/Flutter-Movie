import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/enums/screenshot_type.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';

//TODO replace with your own action
enum UserPageAction { action,setListDetail,cellTapped,loadMore,sortChanged,setSort,screenShot }

class UserPageActionCreator {
  static Action onAction() {
    return const Action(UserPageAction.action);
  }
  static Action setListDetail(ListDetailModel d) {
    return Action(UserPageAction.setListDetail,payload: d);
  }
  static Action cellTapped(ListDetailResult result) {
    return Action(UserPageAction.cellTapped,payload: result);
  }
  static Action loadMore(ListDetailModel d) {
    return Action(UserPageAction.loadMore,payload: d);
  }
  static Action sortChanged(SortCondition d) {
    return Action(UserPageAction.sortChanged,payload: d);
  }
  static Action setSort(SortCondition d) {
    return Action(UserPageAction.setSort,payload: d);
  }
  static Action screenShot(ScreenShotType type) {
    return Action(UserPageAction.screenShot,payload: type);
  }
}
