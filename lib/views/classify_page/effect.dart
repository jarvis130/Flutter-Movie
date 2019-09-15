import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ClassifyState> buildEffect() {
  return combineEffects(<Object, Effect<ClassifyState>>{
    ClassifyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ClassifyState> ctx) {
}
