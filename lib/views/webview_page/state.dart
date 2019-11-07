import 'package:fish_redux/fish_redux.dart';

class WebPageState implements Cloneable<WebPageState> {

  String username;
  String uid;
  String token;
  String client;
  @override
  WebPageState clone() {
    return WebPageState()
    ..uid = uid
    ..token = token
      ..client = client
    ..username = username;
  }
}

WebPageState initState(Map<String, dynamic> args){
  return WebPageState();
}
