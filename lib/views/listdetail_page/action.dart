import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/enums/screenshot_type.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';

//TODO replace with your own action
enum ListDetailPageAction { action,setListDetail,cellTapped,loadMore,sortChanged,setSort,screenShot, onAttention, updateUserInfo}

class ListDetailPageActionCreator {
  static Action onAction() {
    return const Action(ListDetailPageAction.action);
  }
  static Action setListDetail(ListDetailModel d) {
    return Action(ListDetailPageAction.setListDetail,payload: d);
  }
  static Action cellTapped(Product videos) {
    return Action(ListDetailPageAction.cellTapped,payload: videos);
  }
  static Action loadMore(GoodProducts d) {
    return Action(ListDetailPageAction.loadMore,payload: d);
  }
  static Action sortChanged(SortCondition d) {
    return Action(ListDetailPageAction.sortChanged,payload: d);
  }
  static Action setSort(SortCondition d) {
    return Action(ListDetailPageAction.setSort,payload: d);
  }
  static Action screenShot(ScreenShotType type) {
    return Action(ListDetailPageAction.screenShot,payload: type);
  }
  static Action setAttention(int userId) {
    return Action(ListDetailPageAction.onAttention,payload: userId);
  }
  static Action updateUserInfo(UserModel d) {
    return Action(ListDetailPageAction.updateUserInfo, payload: d);
  }
}
