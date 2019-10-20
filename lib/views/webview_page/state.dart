import 'package:fish_redux/fish_redux.dart';

class WebPageState implements Cloneable<WebPageState> {

  @override
  WebPageState clone() {
    return WebPageState();
  }
}

WebPageState initState(Map<String, dynamic> args) {
  return WebPageState();
}
