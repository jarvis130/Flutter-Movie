import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReviewAction { action, openReview }

class ReviewActionCreator {
  static Action onAction() {
    return const Action(ReviewAction.action);
  }
  static Action onOpenReview(String videoid) {
    return Action(ReviewAction.openReview, payload: videoid);
  }
}
