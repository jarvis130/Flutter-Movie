import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<NewMovieState> buildEffect() {
  return combineEffects(<Object, Effect<NewMovieState>>{
    NewMovieAction.action: _onAction,
    NewMovieAction.cellTapped: _onCellTapped,
  });
}

void _onAction(Action action, Context<NewMovieState> ctx) {
}

Future _onCellTapped(Action action, Context<NewMovieState> ctx) async{

  await Navigator.of(ctx.context).pushNamed('moviedetailpage',arguments:{'movieid':action.payload[0],'bgpic':action.payload[1],'title':action.payload[2],'posterpic':action.payload[3]});
  
}
