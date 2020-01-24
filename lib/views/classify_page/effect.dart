import 'package:fish_redux/fish_redux.dart';
import 'package:movie/api/classify_api.dart';
import 'package:movie/api/product_api.dart';
import 'package:movie/widgets/custom_stfstate.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/models/VideoAttributeModel.dart';
import 'action.dart';
import 'state.dart';

Effect<ClassifyPageState> buildEffect() {
  return combineEffects(<Object, Effect<ClassifyPageState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.deactivate: _onDeactivate,
    Lifecycle.dispose: _onDispose,
    ClassifyPageAction.action: _onAction,
    ClassifyPageAction.cellTapped: _cellTapped,
    ClassifyPageAction.onUpdateGroupValue: _onUpdateGroupValue,
    ClassifyPageAction.onRefresh: _onRefresh
  });
}

void _onAction(Action action, Context<ClassifyPageState> ctx) {
}

final List list1 =[
  {
    "title": "最近热播",
    "value":0,
  },
  {
    "title": "最新上架",
    "value":1
  },
  {
    "title": "热门推荐",
    "value":2
  }
];

Future _onInit(Action action, Context<ClassifyPageState> ctx) async {
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.animationController =
      AnimationController(vsync: ticker, duration: Duration(milliseconds: 300));
  ctx.state.cellAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));
  
  ctx.state.scrollController = ScrollController(keepScrollOffset: true)
    ..addListener(() async {
      bool isBottom = ctx.state.scrollController.position.pixels == ctx.state.scrollController.position.maxScrollExtent;
      if (isBottom) {
        _loadMore(action, ctx);
      }
    });

//  List list2 =[
//    {
//      "title": "全部",
//      "value":0,
//    },
//    {
//      "title": "大陆",
//      "value":1
//    },
//    {
//      "title": "香港",
//      "value":2
//    },
//    {
//      "title": "台湾",
//      "value":3
//    },
//    {
//      "title": "欧美",
//      "value":4
//    },
//    {
//      "title": "日本",
//      "value":5
//    },
//  ];
//
//  List list3 =[
//    {
//      "title": "全部",
//      "value":0,
//    },
//    {
//      "title": "喜剧",
//      "value":1
//    },
//    {
//      "title": "动作",
//      "value":2
//    },
//    {
//      "title": "爱情",
//      "value":3
//    },
//    {
//      "title": "惊悚",
//      "value":4
//    },
//    {
//      "title": "犯罪",
//      "value":5
//    },
//  ];

  VideoAttributeModel model = await ClassifyApi.getVideoAttribute();
  if(model != null){
    Map map = {
      'list1': list1,
      'list2': model.videoarea,
      'list3': model.videotype
    };
    ctx.dispatch(ClassifyActionCreator.init(map));
    _loadMore(action, ctx);
  }


}

void _onDispose(Action action, Context<ClassifyPageState> ctx) {
  ctx.state.cellAnimationController.stop();
  ctx.state.scrollController.dispose();
  ctx.state.animationController.dispose();
  ctx.state.cellAnimationController.dispose();
}

void _onDeactivate(Action action, Context<ClassifyPageState> ctx) {
  ctx.state.cellAnimationController.stop();
  ctx.state.animationController.stop();
}

Future _loadMore(Action action, Context<ClassifyPageState> ctx) async {

//    ctx.dispatch(ClassifyActionCreator.updatePerformingRequest(true));

    GoodProducts model = await getGoodProducts(action, ctx);
    if (model != null){
      ctx.dispatch(ClassifyActionCreator.loadMore(model));
    }
}

Future _cellTapped(Action action, Context<ClassifyPageState> ctx) async {

  await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
    'movieid': action.payload[0],
    'bgpic': action.payload[2],
    'title': action.payload[1],
    'posterpic': action.payload[3]
  });
}

Future _onUpdateGroupValue(Action action, Context<ClassifyPageState> ctx) async {

  Map map = action.payload;
  ctx.dispatch(ClassifyActionCreator.updateGroupValue(map));
  ctx.state.currentPage = 0;
  _loadMore(action, ctx);
}

Future<GoodProducts> getGoodProducts(Action action, Context<ClassifyPageState> ctx) async{
  int currentPage = ctx.state.currentPage + 1;
  int is_hot = 0;
  int is_new = 0;
  int is_best = 0;
  String title1 = '';
  String title2 = '';
  if(ctx.state.groupValue1 == 0){
    // 热播
    is_hot = 1;
  }else if(ctx.state.groupValue1 == 1){
    is_new = 1;
  }else{
    is_best = 1;
  }
  if(ctx.state.groupTitle2 != '全部'){
    title1 = ctx.state.groupTitle2;
  }
  if(ctx.state.groupTitle3 != '全部'){
    title2 = ctx.state.groupTitle3;
  }
  GoodProducts model = await ProductApi.getList(
    page: currentPage,
    per_page: GlobalConfig.PageSize,
    is_hot: is_hot,
    is_best: is_best,
    is_new: is_new,
    attr_value1: title1,
    attr_value2: title2,
    is_real: '2'
  );
  return model;
}

Future _onRefresh(Action action, Context<ClassifyPageState> ctx) async{
  ctx.state.currentPage = 0;
  VideoAttributeModel model = await ClassifyApi.getVideoAttribute();
  if(model != null){
    Map map = {
      'list1': list1,
      'list2': model.videoarea,
      'list3': model.videotype
    };
    ctx.dispatch(ClassifyActionCreator.init(map));
    _loadMore(action, ctx);
  }
}