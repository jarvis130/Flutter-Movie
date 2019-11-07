import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<WebPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebPageState>>{
      WebPageAction.action: _onAction,
      WebPageAction.setUsername: _onSetUsername,
    },
  );
}

WebPageState _onAction(WebPageState state, Action action) {
  final WebPageState newState = state.clone();
  return newState;
}

WebPageState _onSetUsername(WebPageState state, Action action) {
  final WebPageState newState = state.clone();
  newState.username = action.payload['username'];
  newState.uid = action.payload['uid'];
  newState.client = action.payload['client'];
  newState.token = action.payload['token'];
  return newState;
}
