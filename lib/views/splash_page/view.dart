import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'skip_down_time.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  return Stack(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset('images/guide1.png'),
              alignment: Alignment.center,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      Container(
        child: Align(
          alignment: Alignment.topRight,
          child: new GestureDetector(
            onTap: () {
              dispatch(SplashActionCreator.onGoMain());
            },
            child: Container(
              padding: const EdgeInsets.only(top: 50.0, right: 20.0),
              child: SkipDownTimeProgress(
                Color(0xFF888888),
                22.0,
                new Duration(seconds: 3),
                new Size(25.0, 25.0),
                skipText: "跳过",
  //              clickListener: this,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
