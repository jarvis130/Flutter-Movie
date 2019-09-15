import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HotMovieState> buildEffect() {
  return combineEffects(<Object, Effect<HotMovieState>>{
    HotMovieAction.action: _onAction,
    HotMovieAction.cellTapped: _onCellTapped
  });
}

void _onAction(Action action, Context<HotMovieState> ctx) {
}

Future _onCellTapped(Action action, Context<HotMovieState> ctx) async {

    await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
      'movieid': action.payload[0],
      'bgpic': action.payload[1],
      'title': action.payload[2],
      'posterpic': action.payload[3]
    });

}