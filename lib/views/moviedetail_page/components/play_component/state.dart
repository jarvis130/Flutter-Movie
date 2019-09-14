import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/videomodel.dart';

import '../../state.dart';

class PlayState implements Cloneable<PlayState> {

  VideoModel movie;

  @override
  PlayState clone() {
    return PlayState()
    ..movie = movie;
  }
}

class PlayConnector extends ConnOp<MovieDetailPageState, PlayState>{
  @override
  PlayState get(MovieDetailPageState state) {

    PlayState substate = new PlayState();
    // substate.movie = state.movieDetailModel


    return substate;
  }
}
