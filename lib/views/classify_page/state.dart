import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/classify_list_model.dart';
import 'package:flutter/material.dart';

class ClassifyPageState implements Cloneable<ClassifyPageState> {

  ClassifyListModel classifyModel;
  ScrollController scrollController;
  AnimationController animationController;
  AnimationController cellAnimationController;

  @override
  ClassifyPageState clone() {
    return ClassifyPageState()
    ..classifyModel = classifyModel
    ..scrollController = scrollController
    ..animationController=animationController
    ..cellAnimationController=cellAnimationController;
  }
}

ClassifyPageState initState(Map<String, dynamic> args) {
  var state = ClassifyPageState();
  state.classifyModel = ClassifyListModel.fromParams(results: []);
  return state;
}
