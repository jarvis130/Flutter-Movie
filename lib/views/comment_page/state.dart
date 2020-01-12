import 'package:fish_redux/fish_redux.dart';

class CommentState implements Cloneable<CommentState> {

  int videoid;
  String content;

  @override
  CommentState clone() {
    return CommentState()
    ..videoid = videoid
    ..content = content;
  }
}

CommentState initState(Map<String, dynamic> args) {
  var state = CommentState();
  state.videoid = args['videoid'];
  return state;
}
