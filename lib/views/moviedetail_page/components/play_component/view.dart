import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/customwidgets/video_widget.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(PlayState state, Dispatch dispatch, ViewService viewService) {

  if (state.href == null) {
      return Container(
      );
  } else {
    String url = state.href;
    return VideoWidget(url);
  }
  
}
