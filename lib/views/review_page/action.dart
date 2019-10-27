import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReviewAction { action, setComment }

class ReviewActionCreator {
  static Action onAction() {
    return const Action(ReviewAction.action);
  }

  static Action onSetComment(String videoid) {
    return  Action(ReviewAction.setComment, payload: videoid);
  }

}
