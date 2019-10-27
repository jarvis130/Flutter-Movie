import 'package:fish_redux/fish_redux.dart';

class WebPageState implements Cloneable<WebPageState> {

  String username;
  @override
  WebPageState clone() {
    return WebPageState()
    ..username = username;
  }
}

WebPageState initState(Map<String, dynamic> args){
  return WebPageState();
}
