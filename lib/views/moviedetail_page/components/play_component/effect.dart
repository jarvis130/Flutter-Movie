import 'package:fish_redux/fish_redux.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayState> buildEffect() {
  return combineEffects(<Object, Effect<PlayState>>{
    PlayAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose
  });
}

void _onAction(Action action, Context<PlayState> ctx) {
}

void _onInit(Action action, Context<PlayState> ctx) {
  // ctx.state.videoPlayerController = VideoPlayerController.network('http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4');
}

void _onDispose(Action action, Context<PlayState> ctx) {
//  ctx.state.videoPlayerController.dispose();
//  ctx.state.chewieController.dispose();
}
