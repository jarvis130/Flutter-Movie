import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<ReviewState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewState>>{
    ReviewAction.action: _onAction,
    ReviewAction.openReview: _onOpenReview
  });
}

void _onAction(Action action, Context<ReviewState> ctx) {
}

void _onOpenReview(Action action, Context<ReviewState> ctx) async {

  await Navigator.of(ctx.context).pushNamed('reviewPage', arguments: {
    'videoid': action.payload
  });

}
