import 'package:fish_redux/fish_redux.dart';

class ClassifyState implements Cloneable<ClassifyState> {

  @override
  ClassifyState clone() {
    return ClassifyState();
  }
}

ClassifyState initState(Map<String, dynamic> args) {
  return ClassifyState();
}
