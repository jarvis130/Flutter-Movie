import 'package:fish_redux/fish_redux.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'package:movie/views/moviedetail_page/action.dart';
import 'action.dart';
import 'state.dart';

Effect<MenuState> buildEffect() {
  return combineEffects(<Object, Effect<MenuState>>{
    MenuAction.action: _onAction,
    MenuAction.setRating:_setRating,
    MenuAction.setFavorite:_setFavorite,
    MenuAction.setWatchlist:_setWatchlist,
  });
}

void _onAction(Action action, Context<MenuState> ctx) {
}

Future _setRating(Action action, Context<MenuState> ctx) async{
//  ctx.dispatch(MenuActionCreator.updateRating(action.payload));
//  var r=await ApiHelper.rateMovie(ctx.state.id, action.payload);
//  if(r)ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('your rating has been saved'));
}

Future _setFavorite(Action action, Context<MenuState> ctx) async{
  int f=action.payload;

  if(f == 1){
    Map r = await MoiveDetailApi.unLike(ctx.state.model.product.id);
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('取消收藏'));
//    ctx.broadcast(MyActionCreator.onLoadFavorites());
    f = 0;
  }else{
    Map r = await MoiveDetailApi.setLike(ctx.state.model.product.id);
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('收藏成功！'));
//    ctx.broadcast(MyActionCreator.onLoadFavorites());
    f = 1;
  }
  ctx.dispatch(MenuActionCreator.updateFavorite(f));
}

Future _setWatchlist(Action action, Context<MenuState> ctx) async{
  final bool f=action.payload;
  ctx.dispatch(MenuActionCreator.updateWatctlist(f));

//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String uid = prefs.getString('uid');
//  String accessTokenV4 = prefs.getString('accessTokenV4');
//  MovieDetailModel r=await MoiveDetailApi.setAttent(uid, accessTokenV4, ctx.state.userinfo['id']);
//  if(r != null){
//    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar(r.isattent == '1' ? '已关注':'取消关注'));
//    ctx.broadcast(MyActionCreator.onLoadConcern());
//  }

}

