import 'package:fish_redux/fish_redux.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/enums/media_type.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:movie/views/moviedetail_page/action.dart';
import 'package:movie/api/my_api.dart';
import '../../../my_page/action.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/concernlist.dart';
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
  final bool f=action.payload;
  ctx.dispatch(MenuActionCreator.updateFavorite(f));
  // var r=await ApiHelper.markAsFavorite(ctx.state.id,MediaType.movie, f);
  // if(r)ctx.broadcast(MovieDetailPageActionCreator.showSnackBar(f?'has been mark as favorite':'has been removed'));

  MovieDetailModel r=await MoiveDetailApi.addCollect(ApiHelper.uid, ApiHelper.accessTokenV4, ctx.state.id);
  if(r != null){
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar(r.iscollect == '1' ? '收藏成功！':'取消收藏'));
    //
    ctx.broadcast(MyActionCreator.onLoadFavorites());
  }


}

Future _setWatchlist(Action action, Context<MenuState> ctx) async{
  final bool f=action.payload;
  ctx.dispatch(MenuActionCreator.updateWatctlist(f));

  // var r=await ApiHelper.addToWatchlist(ctx.state.id,MediaType.movie, f);
  // if(r)ctx.broadcast(MovieDetailPageActionCreator.showSnackBar(f?'has been add to your watchlist':'has been removed from your watchlist'));
  MovieDetailModel r=await MoiveDetailApi.setAttent(ApiHelper.uid, ApiHelper.accessTokenV4, ctx.state.userinfo['id']);
  if(r != null){
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar(r.isattent == '1' ? '已关注':'取消关注'));
    //
    ctx.broadcast(MyActionCreator.onLoadConcern());
  }

}

