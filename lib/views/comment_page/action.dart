import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentAction { action, setComment }

class ReviewActionCreator {
  static Action onAction() {
    return const Action(CommentAction.action);
  }

  static Action onSetComment(String videoid) {
    return  Action(CommentAction.setComment, payload: videoid);
  }

}
