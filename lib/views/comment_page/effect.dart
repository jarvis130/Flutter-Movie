import 'package:fish_redux/fish_redux.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/api/comment_api.dart';
import 'package:movie/views/moviedetail_page/action.dart';

import 'action.dart';
import 'state.dart';

Effect<CommentState> buildEffect() {
  return combineEffects(<Object, Effect<CommentState>>{
    CommentAction.action: _onAction,
    CommentAction.setComment: _onSetComment,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<CommentState> ctx) {
}

void _onInit(Action action, Context<CommentState> ctx) {

}

void _onSetComment(Action action, Context<CommentState> ctx) async{
  var videoid = action.payload;
  await CommentApi.addComment(
    comment_type: 2,
    id_value: videoid,
    content: ctx.state.content,
    status: 1
  );
   ctx.broadcast(MovieDetailPageActionCreator.onReviewMore(videoid));
}
