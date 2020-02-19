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
    MenuAction.setAttention:_setAttention,
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
    Map r = await MovieDetailApi.unLike(ctx.state.model.product.id);
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('取消收藏'));
//    ctx.broadcast(MyActionCreator.onLoadFavorites());
    f = 0;
  }else{
    Map r = await MovieDetailApi.setLike(ctx.state.model.product.id);
    ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('收藏成功！'));
//    ctx.broadcast(MyActionCreator.onLoadFavorites());
    f = 1;
  }
  ctx.dispatch(MenuActionCreator.updateFavorite(f));
}

Future _setAttention(Action action, Context<MenuState> ctx) async{
  int userId=action.payload;
  int f = 0;
  Map map = await MovieDetailApi.setAttention(userId);
  if(map != null){
    if(map['is_attention'] == false){
      ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('取消关注'));
      f = 0;
    }else{
      ctx.broadcast(MovieDetailPageActionCreator.showSnackBar('关注成功！'));
      f = 1;
    }
    ctx.dispatch(MenuActionCreator.updateAttention(f));
  }


}

