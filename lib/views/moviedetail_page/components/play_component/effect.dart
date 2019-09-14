import 'package:fish_redux/fish_redux.dart';
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




}

void _onDispose(Action action, Context<PlayState> ctx) {
//  ctx.state.videoPlayerController.dispose();
//  ctx.state.chewieController.dispose();
}
