import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DouyinPageState> buildEffect() {
  return combineEffects(<Object, Effect<DouyinPageState>>{
    DouyinPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DouyinPageState> ctx) {
}
