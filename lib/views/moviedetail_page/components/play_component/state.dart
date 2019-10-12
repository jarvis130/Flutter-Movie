import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';
import '../../state.dart';

class PlayState implements Cloneable<PlayState> {

  String  href;
//  VideoPlayerController videoPlayerController;

  @override
  PlayState clone() {
    return PlayState()
//    ..videoPlayerController = videoPlayerController
    ..href = href;
  }
}

class PlayConnector extends ConnOp<MovieDetailPageState, PlayState>{
  @override
  PlayState get(MovieDetailPageState state) {

    PlayState substate = new PlayState();
    substate.href = state.movieDetailModel.href;
    return substate;
  }
}
