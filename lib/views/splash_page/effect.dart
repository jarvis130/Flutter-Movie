import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    SplashAction.goMain: _onGoMain,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}

Future _onInit(Action action, Context<SplashState> ctx) {
  Future.delayed(new Duration(seconds: 3), () async {
    await Navigator.of(ctx.context).pushNamedAndRemoveUntil('mainpage', (Route<dynamic> route) => false);
  });
}

void _onGoMain(Action action, Context<SplashState> ctx) async {
  await Navigator.of(ctx.context).pushNamedAndRemoveUntil('mainpage', (Route<dynamic> route) => false);
}
