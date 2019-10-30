import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:video_player/video_player.dart';
import '../../state.dart';

class PlayState implements Cloneable<PlayState> {

  String  href;
  MovieDetailModel movieDetailModel;
//  VideoPlayerController videoPlayerController;

  @override
  PlayState clone() {
    return PlayState()
//    ..videoPlayerController = videoPlayerController
    ..movieDetailModel = movieDetailModel
    ..href = href;
  }
}

class PlayConnector extends ConnOp<MovieDetailPageState, PlayState>{
  @override
  PlayState get(MovieDetailPageState state) {

    PlayState substate = new PlayState();
    substate.href = state.movieDetailModel.href;
    substate.movieDetailModel = state.movieDetailModel;
    return substate;
  }
}
