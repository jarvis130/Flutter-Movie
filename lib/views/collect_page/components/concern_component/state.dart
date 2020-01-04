import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/UserListModel.dart';
import 'package:flutter/widgets.dart';
import '../../state.dart';

class ConcernState implements Cloneable<ConcernState> {

  UserListModel userListModel;
  ScrollController movieController;

  @override
  ConcernState clone() {
    return ConcernState()
    ..userListModel = userListModel
    ..movieController = movieController;
  }
}

class ConcernConnector extends ConnOp<CollectState, ConcernState>{
  @override
  ConcernState get(CollectState state) {
    ConcernState substate = new ConcernState();
    substate.userListModel = state.userListModel;
    substate.movieController = state.concernsController;
    return substate;
  }
}

