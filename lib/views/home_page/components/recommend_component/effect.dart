import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RecommendState> buildEffect() {
  return combineEffects(<Object, Effect<RecommendState>>{
    RecommendMovieAction.action: _onAction,
    RecommendMovieAction.cellTapped: _onCellTapped
  });
}

void _onAction(Action action, Context<RecommendState> ctx) {
}

Future _onCellTapped(Action action, Context<RecommendState> ctx) async {

    await Navigator.of(ctx.context).pushNamed('moviedetailpage', arguments: {
      'movieid': action.payload[0],
      'bgpic': action.payload[1],
      'title': action.payload[2],
      'posterpic': action.payload[3]
    });

}
