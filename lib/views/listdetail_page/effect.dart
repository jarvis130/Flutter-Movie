import 'dart:io';
import 'dart:convert';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/enums/screenshot_type.dart';
import 'package:movie/models/sortcondition.dart';
import 'package:movie/models/videolist.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';
import 'package:movie/api/listdetail_api.dart';
import 'action.dart';
import 'state.dart';

Effect<ListDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<ListDetailPageState>>{
    Lifecycle.initState: _onInit,
    ListDetailPageAction.action: _onAction,
    ListDetailPageAction.cellTapped: _cellTapped,
    ListDetailPageAction.sortChanged: _sortChanged,
  });
}

void _onAction(Action action, Context<ListDetailPageState> ctx) {}

Future _onInit(Action action, Context<ListDetailPageState> ctx) async {
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

Future _cellTapped(Action action, Context<ListDetailPageState> ctx) async {
  VideoListResult d = action.payload;
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

Future _sortChanged(Action action, Context<ListDetailPageState> ctx) async {
  final SortCondition model = action.payload;
  if (model.value != ctx.state.sortType) {
    ctx.dispatch(ListDetailPageActionCreator.setSort(model));
    _loadData(action, ctx);
  }
}

Future _loadData(Action action, Context<ListDetailPageState> ctx) async {
  if (ctx.state.userid != null) {
    // var r = await ApiHelper.getListDetailV4(ctx.state.userid,
    //     sortBy: ctx.state.sortType);
    // if (r != null) ctx.dispatch(ListDetailPageActionCreator.setListDetail(r));
    var r = await ListDetailApi.getUserHome(ctx.state.userid);
    if (r != null)
      ctx.dispatch(ListDetailPageActionCreator.loadMore(r));
  }
}
