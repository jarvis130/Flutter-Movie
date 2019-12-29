import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ConcernState> buildEffect() {
  return combineEffects(<Object, Effect<ConcernState>>{
    ConcernAction.action: _onAction,
    ConcernAction.cellTappedToListDetail: _onCellTappedToListDetail
  });
}

void _onAction(Action action, Context<ConcernState> ctx) {
}

Future _onCellTappedToListDetail(Action action, Context<ConcernState> ctx) async{
  await Navigator.of(ctx.context).pushNamed('ListDetailPage', arguments: {
      'userid': action.payload[0]
    });
}
