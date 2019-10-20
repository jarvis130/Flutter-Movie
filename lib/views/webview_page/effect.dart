import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WebPageState> buildEffect() {
  return combineEffects(<Object, Effect<WebPageState>>{
    WebPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WebPageState> ctx) {
}
