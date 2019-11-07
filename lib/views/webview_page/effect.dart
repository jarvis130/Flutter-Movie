import 'package:fish_redux/fish_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'action.dart';
import 'state.dart';

Effect<WebPageState> buildEffect() {
  return combineEffects(<Object, Effect<WebPageState>>{
    WebPageAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<WebPageState> ctx) {
}

void _onInit(Action action, Context<WebPageState> ctx) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString('username');
  String uid = prefs.getString('uid');
  String token = prefs.getString('accessTokenV4');
  String client = prefs.getString('client');
  ctx.dispatch(WebPageActionCreator.setUsername({
    'username': username,
    'uid': uid,
    'token': token,
    'client': client
  }));
}