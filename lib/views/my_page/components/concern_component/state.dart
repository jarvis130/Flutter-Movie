import 'package:fish_redux/fish_redux.dart';

class ConcernState implements Cloneable<ConcernState> {

  @override
  ConcernState clone() {
    return ConcernState();
  }
}

ConcernState initState(Map<String, dynamic> args) {
  return ConcernState();
}
