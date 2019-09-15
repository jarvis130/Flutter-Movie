import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClassifyState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassifyState>>{
      ClassifyAction.action: _onAction,
    },
  );
}

ClassifyState _onAction(ClassifyState state, Action action) {
  final ClassifyState newState = state.clone();
  return newState;
}
