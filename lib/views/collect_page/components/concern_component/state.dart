import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/concernlist.dart';
import 'package:flutter/widgets.dart';
import '../../state.dart';

class ConcernState implements Cloneable<ConcernState> {

  ConcernListModel concernList;
  ScrollController movieController;

  @override
  ConcernState clone() {
    return ConcernState()
    ..concernList = concernList
    ..movieController = movieController;
  }
}

class ConcernConnector extends ConnOp<CollectState, ConcernState>{
  @override
  ConcernState get(CollectState state) {
    ConcernState substate = new ConcernState();
    substate.concernList = state.concerns;
    substate.movieController = state.concernsController;
    return substate;
  }
}

