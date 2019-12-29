import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:video_player/video_player.dart';
import '../../state.dart';

class PlayState implements Cloneable<PlayState> {

  ProductModel movieDetailModel;
//  VideoPlayerController videoPlayerController;

  @override
  PlayState clone() {
    return PlayState()
//    ..videoPlayerController = videoPlayerController
    ..movieDetailModel = movieDetailModel;
  }
}

class PlayConnector extends ConnOp<MovieDetailPageState, PlayState>{
  @override
  PlayState get(MovieDetailPageState state) {

    PlayState substate = new PlayState();
    substate.movieDetailModel = state.movieDetailModel;
    return substate;
  }
}
