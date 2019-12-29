import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/ProductModel.dart';

import '../../state.dart';

class MenuState implements Cloneable<MenuState> {

  ProductModel model;

  @override
  MenuState clone() {
    return MenuState()
    ..model=model;
  }
}

class MenuConnector extends ConnOp<MovieDetailPageState,MenuState>{
  @override
  MenuState get(MovieDetailPageState state) {
    MenuState substate=new MenuState();
    substate.model=state.movieDetailModel;
    return substate;
  }
//  @override
//  void set(MovieDetailPageState state, MenuState subState) {
//    state.accountState=subState.accountState;
//  }
}
