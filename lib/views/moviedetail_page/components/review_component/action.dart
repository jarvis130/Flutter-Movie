import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/CommentModel.dart';

//TODO replace with your own action
enum ReviewAction { action, openReview, loadmore }

class ReviewActionCreator {
  static Action onAction() {
    return const Action(ReviewAction.action);
  }
  static Action onOpenReview(int videoid) {
    return Action(ReviewAction.openReview, payload: videoid);
  }
  static Action loadMore(CommentModel model) {
    return Action(ReviewAction.loadmore, payload: model);
  }
}
