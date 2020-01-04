import 'dart:io';
import 'dart:convert';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/api/product_api.dart';
import 'package:movie/api/user_api.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserDetailModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/views/moviedetail_page/components/menu_component/action.dart';
import 'package:movie/models/sortcondition.dart';
import 'action.dart';
import 'state.dart';

Effect<ListDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<ListDetailPageState>>{
    Lifecycle.initState: _onInit,
    ListDetailPageAction.action: _onAction,
    ListDetailPageAction.cellTapped: _cellTapped,
    ListDetailPageAction.sortChanged: _sortChanged,
    ListDetailPageAction.onAttention: _setAttention,
  });
}

void _onAction(Action action, Context<ListDetailPageState> ctx) {}

Future _onInit(Action action, Context<ListDetailPageState> ctx) async {
  ctx.state.scrollController = ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
           GoodProducts model;
           int currentPage = ctx.state.currentPage + 1;
           if(currentPage == 1){
             model = await ProductApi.getList(page: currentPage, is_hot: 1);
             if (model != null){
               ctx.dispatch(ListDetailPageActionCreator.loadMore(model));
             }
           }
      }
    });
  _loadData(action, ctx);
}

Future _cellTapped(Action action, Context<ListDetailPageState> ctx) async {
  Products d = action.payload;

  await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
        'movieid': d.id.toString(),
        'bgpic': d.defaultPhoto.thumb,
        'title': d.name,
        'posterpic': d.defaultPhoto.thumb
      });
}

Future _sortChanged(Action action, Context<ListDetailPageState> ctx) async {
  final SortCondition model = action.payload;
  if (model.value != ctx.state.sortType) {
    ctx.dispatch(ListDetailPageActionCreator.setSort(model));
    _loadData(action, ctx);
  }
}

Future _loadData(Action action, Context<ListDetailPageState> ctx) async {
  //用户信息
  if (ctx.state.userid != null) {
    UserModel r = await UserApi.getUserInfoByUserId(ctx.state.userid);
    if (r != null)
      ctx.dispatch(ListDetailPageActionCreator.updateUserInfo(r));
  }
  //视频信息
  GoodProducts model;
  int currentPage = ctx.state.currentPage + 1;
  if(currentPage == 1){
    model = await ProductApi.getList(page: currentPage, pub_id: ctx.state.userid);
    if (model != null){
      ctx.dispatch(ListDetailPageActionCreator.loadMore(model));
    }
  }

}

Future _setAttention(Action action, Context<ListDetailPageState> ctx) async {
  int userId = action.payload;
  ctx.broadcast(MenuActionCreator.setAttention(userId));
}
