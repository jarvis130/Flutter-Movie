import 'package:fish_redux/fish_redux.dart';

class ReviewState implements Cloneable<ReviewState> {

  String videoid;
  String content;

  @override
  ReviewState clone() {
    return ReviewState()
    ..videoid = videoid
    ..content = content;
  }
}

ReviewState initState(Map<String, dynamic> args) {
  var state = ReviewState();
  state.videoid = args['videoid'];
  return state;
}
