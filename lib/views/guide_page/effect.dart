import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<GuideState> buildEffect() {
  return combineEffects(<Object, Effect<GuideState>>{
    GuideAction.action: _onAction,
    GuideAction.goMain: _onGoMain
  });
}

void _onAction(Action action, Context<GuideState> ctx) {
}

void _onGoMain(Action action, Context<GuideState> ctx) async {
  await Navigator.of(ctx.context).pushNamedAndRemoveUntil('mainpage', (Route<dynamic> route) => false);
}
