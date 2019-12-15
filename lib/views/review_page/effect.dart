import 'package:fish_redux/fish_redux.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/review_api.dart';
import 'package:movie/views/moviedetail_page/action.dart';

import 'action.dart';
import 'state.dart';

Effect<ReviewState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewState>>{
    ReviewAction.action: _onAction,
    ReviewAction.setComment: _onSetComment,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<ReviewState> ctx) {
}

void _onInit(Action action, Context<ReviewState> ctx) {

}

void _onSetComment(Action action, Context<ReviewState> ctx) async{
  var videoid = action.payload;
   await ReviewApi.setComment(ApiHelper.uid, videoid, ApiHelper.token, ctx.state.content);
   ctx.broadcast(MovieDetailPageActionCreator.onReviewMore(videoid));
}
