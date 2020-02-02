import 'package:fish_redux/fish_redux.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/api/user_api.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';
import 'action.dart';
import 'state.dart';

Effect<UserPageState> buildEffect() {
  return combineEffects(<Object, Effect<UserPageState>>{
    UserPageAction.action: _onAction,
    Lifecycle.initState: _onInit,
    UserPageAction.cellTapped: _cellTapped,
    UserPageAction.sortChanged: _sortChanged,
    UserPageAction.shopping: _shopping,
    UserPageAction.favoritesTapped: _favoritesTapped,
    UserPageAction.watchLogTapped: _watchLogTapped,
    UserPageAction.onRefresh: _onRefresh
  });
}

void _onAction(Action action, Context<UserPageState> ctx) {
}


Future _onInit(Action action, Context<UserPageState> ctx) async {
  ctx.state.scrollController = ScrollController()
    ..addListener(() async {
      bool isBottom = ctx.state.scrollController.position.pixels ==
          ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
        // if (ctx.state.listDetailModel.id != null) {
        //   int page = ctx.state.listDetailModel.page + 1;
        //   if (page <= ctx.state.listDetailModel.totalPages) {
        //     // var r = await ApiHelper.getListDetailV4(ctx.state.userid,
        //     //     page: page, sortBy: ctx.state.sortType);
        //     // if (r != null)
        //     //   ctx.dispatch(ListDetailPageActionCreator.loadMore(r));
        //     var r = await ListDetailApi.getUserHome(ctx.state.userid);
        //     if (r != null)
        //       ctx.dispatch(ListDetailPageActionCreator.loadMore(r));
        //   }
        // }
      }
    });
  _loadData(action, ctx);
}

Future _cellTapped(Action action, Context<UserPageState> ctx) async {
  ListDetailResult d = action.payload;
  // if (d != null) {
  //   if (d.mediaType == 'movie')
  //     await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
  //       'movieid': d.id,
  //       'bgpic': d.backdrop_path,
  //       'title': d.title,
  //       'posterpic': d.poster_path
  //     });
  //   else
  //     await Navigator.of(ctx.context).pushNamed('tvdetailpage', arguments: {
  //       'tvid': d.id,
  //       'bgpic': d.backdrop_path,
  //       'name': d.name,
  //       'posterpic': d.poster_path
  //     });
  // }
  await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
    'movieid': d.id,
    'bgpic': d.thumb_s,
    'title': d.title,
    'posterpic': d.thumb_s
  });
}

Future _sortChanged(Action action, Context<UserPageState> ctx) async {
  final SortCondition model = action.payload;
  if (model.value != ctx.state.sortType) {
    ctx.dispatch(UserPageActionCreator.setSort(model));
    _loadData(action, ctx);
  }
}

Future _loadData(Action action, Context<UserPageState> ctx) async {

  UserModel model = await UserApi.getUserProfile(ctx.context);
  if (model != null)
    ctx.dispatch(UserPageActionCreator.loadMore(model));

}

Future _onRefresh(Action action, Context<UserPageState> ctx) async {

  _loadData(action, ctx);

}

void _shopping(Action action, Context<UserPageState> ctx) async {
//  await Navigator.of(ctx.context).pushNamed('WebPage', arguments: {
//    'uid': ApiHelper.uid
//  });
//  await Navigator.of(ctx.context).pushNamed('PayPage', arguments: {
//    'uid': ApiHelper.uid
//  });
}

//我的收藏
void _favoritesTapped(Action action, Context<UserPageState> ctx) async {
//  await Navigator.of(ctx.context).pushNamed('CollectPage', arguments: {
//    'uid': ApiHelper.uid
//  });
}

//观看记录
void _watchLogTapped(Action action, Context<UserPageState> ctx) async {
//  await Navigator.of(ctx.context).pushNamed('WatchLogPage', arguments: {
//    'uid': ApiHelper.uid
//  });
}