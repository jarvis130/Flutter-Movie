import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SwiperState> buildEffect() {
  return combineEffects(<Object, Effect<SwiperState>>{
    SwiperAction.action: _onAction,
    SwiperAction.cellTapped: _onCellTapped,
  });
}

void _onAction(Action action, Context<SwiperState> ctx) {
}

Future _onCellTapped(Action action, Context<SwiperState> ctx) async{

  await Navigator.of(ctx.context).pushNamed('moviedetailpage',arguments:{'movieid':action.payload[0],'bgpic':action.payload[1],'title':action.payload[2],'posterpic':action.payload[3]});

}